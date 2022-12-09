import 'dart:async';
import 'dart:io';
import 'package:customerloan/model/aadhaar_otp_verify_respose.dart';
import 'package:customerloan/model/aadhaar_verify_otp_request.dart';
import 'package:customerloan/model/get_status_response.dart';
import 'package:customerloan/repository/home_repository.dart';
import 'package:customerloan/util/preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:customerloan/util/snack_bar_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../constant/string_constant.dart';
import '../../../../model/aadhaar_otp_generate_response.dart';
import '../../../../model/aadhar_otp_generate_request.dart';
import '../../../../util/log.dart';
import '../../../../util/string_util.dart';

class HomeController extends GetxController {
  HomeController({required this.repository});

  final HomeRepository repository;

  ///expansionTile
  RxBool isEmailClick = true.obs;
  RxBool isEmailExpansionClick = false.obs;
  RxBool isAadharExpansionClick = false.obs;
  RxBool isCurrentExpansionClick = false.obs;
  RxBool isBankStatementExpansionClick = false.obs;
  RxBool isSelfieExpansionClick = false.obs;
  RxBool isVKycExpansionClick = false.obs;
  RxBool isBankDetailsExpansionClick = false.obs;
  RxBool isENachExpansionClick = false.obs;
  RxBool isESignExpansionClick = false.obs;

  ///Edit controller
  final aadhaarNumberEditingController = TextEditingController();
  final aadhaarOtpEditingController = TextEditingController();

  RxBool isAuthorize = true.obs;

  final List<String> address = ["Yes", "No"];
  String? selectedAddress;
  final List<String> accountType = ["Saving", "Current"];
  String? selectedAccountType;
  final List<String> paymentMode = ["Dabit Card", "Net Banking"];
  String? selectedPaymentMode;

  Rx<GetStatusResponse?> getStatusResponse = GetStatusResponse().obs;
  Rx<AadhaarOtpGenerateResponse?> generateAadhaarOtpData =
      AadhaarOtpGenerateResponse().obs;
  Rx<AadhaarOtpVerifyResponse?> verifyAadhaarOtpData =
      AadhaarOtpVerifyResponse().obs;

  RxInt counter = 0.obs;
  Timer? timer;

  RxString name = "".obs;

  RxInt avilableLimit = 0.obs;
  RxString aadhaarNumber = "".obs;
  RxString aadhaarOtp = "".obs;
  RxBool otpText = false.obs;

  static const platform =
      const MethodChannel('com.example.customerloan/method');
  List<dynamic> emailList = <dynamic>[];

  ///youtube Controller
  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  ///email field
  RxBool isEmailNo = false.obs;

  RxBool isAccountDialogShown = false.obs;
  RxString userEmail = "".obs;
  RxBool isOTPFieldVisible = false.obs;

  RxBool emailverify = false.obs;
  RxBool aadhaarverify = false.obs;
  RxBool addressverify = false.obs;
  RxBool banksatetmentverify = false.obs;
  RxBool selfieverify = false.obs;
  RxBool vkycverify = false.obs;
  RxBool bankdetailverify = false.obs;
  RxBool descripancyverify = false.obs;

  ///address value
  void onAddressRadioButton(value) {
    print(value);
    selectedAddress = value;
    update();
  }

  ///address value
  void onAccountTypeRadioButton(value) {
    print(value);
    selectedAccountType = value;
    update();
  }

  ///address value
  void onPaymentMoedRadioButton(value) {
    print(value);
    selectedPaymentMode = value;
    update();
  }

  Future<void> showUserAccountsFromMobile() async {
    if (Platform.isAndroid) {
      MethodChannel _methodChannel =
          MethodChannel('com.example.customerloan/method');
      String result = await _methodChannel.invokeMethod('fetchAccount');
      if (result.isNotEmpty) {
        userEmail.value = result;
      } else {
        isAccountDialogShown.value = true;
      }
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    getStatus();
  }

  Future<void> getStatus() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    repository.getStatus().then((value) {
      EasyLoading.dismiss();
      if (getStatusResponse.value != null) {
        getStatusResponse.value = value;
        var arr =
            getStatusResponse.value?.data?.customer?.identity?.name?.split(' ');
        int? total =
            getStatusResponse.value?.data?.cards?[0].limitData?.total ?? 0;
        int? utilise =
            getStatusResponse.value?.data?.cards?[0].limitData?.utilized ?? 0;
        avilableLimit.value = total - utilise;
        name.value = arr![0];

        descripancyverify.value = getStatusResponse.value!.data!.customer!.isDiscrepancy ?? false;
        int checklimit =
            getStatusResponse.value!.data!.cards![0].cardActiveChecks!.length;

        final preference = PreferenceUtil.getInstance();
        preference.putValue(PreferenceKey.cardId.name, getStatusResponse.value!.data!.cards![0].cardId);

        for (int i = 0; i < checklimit; i++) {
          if (getStatusResponse
                  .value!.data!.cards![0].cardActiveChecks![i].name ==
              "Email") {
            if (getStatusResponse
                    .value!.data!.cards![0].cardActiveChecks![i].uploaded ==
                true) {
              emailverify.value = true;
            }
          }

          if (getStatusResponse
                  .value!.data!.cards![0].cardActiveChecks![i].name ==
              "Aadhaar") {
            if (getStatusResponse
                    .value!.data!.cards![0].cardActiveChecks![i].uploaded ==
                true) {
              aadhaarverify.value = true;
            }
          }

          if (getStatusResponse
                  .value!.data!.cards![0].cardActiveChecks![i].name ==
              "Address") {
            if (getStatusResponse
                    .value!.data!.cards![0].cardActiveChecks![i].uploaded ==
                true) {
              addressverify.value = true;
            }
          }
          if (getStatusResponse
                  .value!.data!.cards![0].cardActiveChecks![i].name ==
              "BankStatement") {
            if (getStatusResponse
                    .value!.data!.cards![0].cardActiveChecks![i].uploaded ==
                true) {
              banksatetmentverify.value = true;
            }
          }
          if (getStatusResponse
                  .value!.data!.cards![0].cardActiveChecks![i].name ==
              "Vkyc") {
            if (getStatusResponse
                    .value!.data!.cards![0].cardActiveChecks![i].uploaded ==
                true) {
              vkycverify.value = true;
            }
          }
          if (getStatusResponse
                  .value!.data!.cards![0].cardActiveChecks![i].name ==
              "Bank") {
            if (getStatusResponse
                    .value!.data!.cards![0].cardActiveChecks![i].uploaded ==
                true) {
              bankdetailverify.value = true;
            }
          }
          if (getStatusResponse
                  .value!.data!.cards![0].cardActiveChecks![i].name ==
              "selfie") {
            if (getStatusResponse
                    .value!.data!.cards![0].cardActiveChecks![i].uploaded ==
                true) {
              selfieverify.value = true;
            }
          }
        }
      }
    }).catchError((error) {
      Utils.showToast(error.toString());
      EasyLoading.dismiss();
      print(error);
    });
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
      Log.d(counter.value.toString());
      if (counter.value > 0) {
        counter.value = counter.value - 1;
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> aadhaarGenrateOTP() async {
    if (StringUtil.validateMobile(aadhaarNumberEditingController.text) ==
        false) {
      Utils.showToast(StringConstant.aadhaarOTPleLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model = AadhaarOtpGenerateRequest(
          aadhar_number: aadhaarNumberEditingController.text);
      repository.aadhaarGenrateOTP(model).then((value) async {
        startTimer();
        EasyLoading.dismiss();
        generateAadhaarOtpData.value = value!;
      }).catchError((error) {
        Utils.showToast(error.toString());
        EasyLoading.dismiss();
        Utils.showToast(error.toString());
      });
    }
  }

  Future<void> aadhaarVerifyOTP() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);

    final model =
        AadhaarVerifyOTPRequest(aadharotp: aadhaarOtpEditingController.text);
    repository.aadhaarVerifyOTP(model).then((value) async {
      startTimer();
      EasyLoading.dismiss();
      verifyAadhaarOtpData.value = value!;
      onInit();
    }).catchError((error) {
      Utils.showToast(error.toString());
      EasyLoading.dismiss();
      Utils.showToast(error.toString());
    });
  }
}
