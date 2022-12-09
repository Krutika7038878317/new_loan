import 'dart:async';

import 'package:customerloan/constant/string_constant.dart';
import 'package:customerloan/model/new_user_otp_verify_response.dart';
import 'package:customerloan/model/send_otp_request.dart';
import 'package:customerloan/model/send_otp_response.dart';
import 'package:customerloan/model/verify_otp_request.dart';
import 'package:customerloan/model/verify_otp_response.dart';
import 'package:customerloan/repository/login_repository.dart';
import 'package:customerloan/route/routes.dart';
import 'package:customerloan/util/preference_util.dart';
import 'package:customerloan/util/snack_bar_util.dart';
import 'package:customerloan/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../util/log.dart';

class LoginController extends GetxController {
  LoginController({required this.repository});

  final LoginRepository repository;
  final mobileNumberTextEditingController = TextEditingController();

  // final otpTextEditingController = TextEditingController();

  RxInt counter = 0.obs;
  RxInt sourceId = 0.obs;
  Timer? timer;
  RxString mobile = "".obs;

  RxBool isOTPFieldVisible = false.obs;
  RxBool isButtonEnable = false.obs;

  Rx<SendOTPResponse?> sendOtpResponseData = SendOTPResponse().obs;
  Rx<VerifyOTPResponse?> oldUserVerifyOtpResponseData = VerifyOTPResponse().obs;
  Rx<NewUserOTPVerifyResponse?> newUserVerifyOtpResponseData =
      NewUserOTPVerifyResponse().obs;

  RxString otpPin = "".obs;
  RxBool isCustomerExist = false.obs;

  @override
  void onInit() {
    super.onInit();
    final preference = PreferenceUtil.getInstance();
    preference.putValue(PreferenceKey.isLoggedIn.name, "true");

    isButtonEnable.value = false;
    isCustomerExist.value = false;
  }

  @override
  void onClose() {
    timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
  }

  /// Resend OTP
  Future<void> startTimer() async {
    counter.value = 60;
    if (timer != null && timer!.isActive) {
      return;
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Log.d(counter.value.toString());
      if (counter.value > 0) {
        counter.value = counter.value - 1;
      } else {
        timer.cancel();
      }
    });
  }

  /// new user Generate OTP
  Future<void> checkCustomerExist() async {
    if (StringUtil.validateMobile(mobileNumberTextEditingController.text) ==
        false) {
      Utils.showToast(StringConstant.stringMobileLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model =
          SendOTPRequest(mobile: "91" + mobileNumberTextEditingController.text);
      repository.checkCustomerExist(model).then((value) async {
        EasyLoading.dismiss();
        sendOtpResponseData.value = value!;
        if (sendOtpResponseData.value?.status == true) {
          /// new user
          isCustomerExist.value = false;
          newCustomerSendOTP();
          print("11111");
        } else {
          /// old user
          oldCustomerSendOTP();
          isCustomerExist.value = true;
          print("22222");
        }
        isOTPFieldVisible.value = true;
      }).catchError((error) {
        Utils.showToast(error.toString());
        EasyLoading.dismiss();
        Utils.showToast(error.toString());
      });
    }
  }

  /// new customer send otp
  Future<void> newCustomerSendOTP() async {
    if (StringUtil.validateMobile(mobileNumberTextEditingController.text) ==
        false) {
      Utils.showToast(StringConstant.stringMobileLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model =
          SendOTPRequest(mobile: "91" + mobileNumberTextEditingController.text);
      repository.newCustomerSendOTP(model).then((value) async {
        EasyLoading.dismiss();
        sendOtpResponseData.value = value!;

        startTimer();
      }).catchError((error) {
        Utils.showToast(error.toString());
        EasyLoading.dismiss();
        Utils.showToast(error.toString());
      });
    }
  }

  /// old customer send otp
  Future<void> oldCustomerSendOTP() async {
    if (StringUtil.validateMobile(mobileNumberTextEditingController.text) ==
        false) {
      Utils.showToast(StringConstant.stringMobileLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model =
          SendOTPRequest(mobile: mobileNumberTextEditingController.text);
      repository.oldCustomersendOTP(model).then((value) async {
        EasyLoading.dismiss();
        sendOtpResponseData.value = value!;

        startTimer();
      }).catchError((error) {
        Utils.showToast(error.toString());
        EasyLoading.dismiss();
        Utils.showToast(error.toString());
      });
    }
  }

  ///New customer Verify OTP
  Future<void> newCustomerVerifyOTP() async {
    print(otpPin);
    if (StringUtil.validateOTP(otpPin.value) == false) {
      Utils.showToast(StringConstant.stringOtpLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model = VerifyOTPRequest(
        mobile: "91" + mobileNumberTextEditingController.text,
        mobileotp: otpPin.value,
      );
      repository.newCustomerVerifyOTP(model).then((value) {
        newUserVerifyOtpResponseData.value = value!;
        EasyLoading.dismiss();
        if (newUserVerifyOtpResponseData.value!.status == true) {
          /// call pan screen

          final preference = PreferenceUtil.getInstance();

          preference.putValue(PreferenceKey.mobile.name,
              mobileNumberTextEditingController.text);
          preference.putValue(PreferenceKey.panNumber.name,
              value.customerHspData?.panDetails?.panNumber.toString());
          preference.putValue(PreferenceKey.panName.name,
              value.customerHspData?.panDetails?.panName.toString());
          preference.putValue(PreferenceKey.panDob.name,
              value.customerHspData?.panDetails?.panData?.dob.toString());
          preference.putValue(
              PreferenceKey.panSalaried.name,
              value.customerHspData?.employmentDetails?.employmentType
                  .toString());
          preference.putValue(PreferenceKey.monthlyIncome.name,
              value.customerHspData?.employmentDetails?.income.toString());
          preference.putValue(PreferenceKey.loanAmount.name,
              value.customerHspData?.loanAmount.toString());
          preference.putValue(PreferenceKey.panPincode.name,
              value.customerHspData?.pincode.toString());
          preference.putValue(PreferenceKey.panEmail.name,
              value.customerHspData?.emailID.toString());

          Get.offAndToNamed(Routes.registration.name);
        } else {
          Utils.showToast(StringConstant.otpErrorLabel);
        }
      }).catchError((error) {
        Utils.showToast(error.toString());
        EasyLoading.dismiss();
      });
    }
  }

  ///old customer Verify OTP
  Future<void> oldCustomerVerifyOTP() async {
    if (StringUtil.validateOTP(otpPin.value) == false) {
      Utils.showToast(StringConstant.stringOtpLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model = VerifyOTPRequest(
        mobile: mobileNumberTextEditingController.text,
        mobileotp: otpPin.value,
      );
      repository.oldCustomerVerifyOTP(model).then((value) {
        oldUserVerifyOtpResponseData.value = value!;
        EasyLoading.dismiss();

        /// call mpin screen or home screen
        if (oldUserVerifyOtpResponseData.value!.status == true) {
          final preference = PreferenceUtil.getInstance();
          preference.putValue(PreferenceKey.mobile.name,
              oldUserVerifyOtpResponseData.value!.data!.mobile.toString());
          preference.putValue(PreferenceKey.name.name,
              oldUserVerifyOtpResponseData.value!.data!.name.toString());
          preference.putValue(
              PreferenceKey.mpin.name,
              oldUserVerifyOtpResponseData.value!.data!.device!.mpin
                  .toString());
          preference.putValue(
              PreferenceKey.fingerprint.name,
              oldUserVerifyOtpResponseData.value!.data!.device!.fingerprint
                  .toString());
          preference.putValue(PreferenceKey.token.name,
              oldUserVerifyOtpResponseData.value!.token.toString());

          print("mpin");
          print(oldUserVerifyOtpResponseData.value!.data!.device!.mpin
              .toString());
          if (oldUserVerifyOtpResponseData.value!.data!.device!.mpin
                      .toString() ==
                  "" &&
              oldUserVerifyOtpResponseData.value!.data!.device!.mpin
                      .toString() ==
                  null &&
              oldUserVerifyOtpResponseData.value!.data!.device!.mpin
                      .toString() ==
                  "null") {
            Get.offAndToNamed(Routes.creatempin.name);
          } else {
            Get.offAndToNamed(Routes.verifympin.name);
          }
        } else {
          Utils.showToast(StringConstant.otpErrorLabel);
        }
      }).catchError((error) {
        Utils.showToast(error.toString());
        EasyLoading.dismiss();
      });
    }
  }
}
