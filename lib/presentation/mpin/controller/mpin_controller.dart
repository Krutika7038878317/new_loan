import 'dart:io';

import 'package:customerloan/constant/string_constant.dart';
import 'package:customerloan/model/create_mpin_request.dart';
import 'package:customerloan/model/device_info_request.dart';
import 'package:customerloan/model/refresh_token_request.dart';
import 'package:customerloan/model/refresh_token_response.dart';
import 'package:customerloan/model/send_otp_response.dart';
import 'package:customerloan/repository/mpin_repository.dart';
import 'package:customerloan/route/routes.dart';
import 'package:customerloan/util/preference_util.dart';
import 'package:customerloan/util/snack_bar_util.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MpinController extends GetxController {
  MpinController({required this.repository});

  final MpinRepository repository;
  Rx<SendOTPResponse?> sendOtpResponseData = SendOTPResponse().obs;
  Rx<RefreshTokenResponse?> refreshTokenResponse = RefreshTokenResponse().obs;

  RxString mpin = "".obs;
  RxString rempin = "".obs;
  RxBool isButtonEnable = false.obs;
  RxBool checkBoxChange = true.obs;
  RxString newmpin = "".obs;

  @override
  void onInit() {
    super.onInit();
    isButtonEnable.value = false;
  }

  ///create mpin
  Future<void> createMpin() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    final model = CreateMpinRequest(mpin: mpin.value, device_login: true);
    repository.createMpin(model).then((value) async {
      EasyLoading.dismiss();
      sendOtpResponseData.value = value!;
      if (sendOtpResponseData.value!.status == true) {
        deviceInfo();
      }
    }).catchError((error) {
      EasyLoading.dismiss();
      Utils.showToast(error.toString());
    });
  }

  ///device info
  Future<void> deviceInfo() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceName;
    String? deviceModel;

    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfo.androidInfo;

      deviceName = info.device;
      deviceModel = info.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfo.iosInfo;

      deviceName = info.name;
      deviceModel = info.model;
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    print(packageInfo.version);
    print(packageInfo.buildNumber);
    String? wifiIP = await NetworkInfo().getWifiIP();

    final model = DeviceInfoRequest(
        id: mpin.value,
        model: deviceModel.toString(),
        version_id: packageInfo.version,
        version: packageInfo.buildNumber,
        name: deviceName.toString(),
        notification_id: "true",
        ip: wifiIP,
        lat: "19.113646",
        lng: "72.869736",
        fingerprint: checkBoxChange.value);
    repository.deviceInfo(model).then((value) async {
      sendOtpResponseData.value = value!;
      EasyLoading.dismiss();
      if (sendOtpResponseData.value!.status == true) {
        final preference = PreferenceUtil.getInstance();
        preference.putValue(PreferenceKey.mpin.name, mpin.value.toString());
        preference.putValue(
            PreferenceKey.fingerprint.name, checkBoxChange.value.toString());
        Get.offAndToNamed(Routes.bottomBar.name);
      } else {
        Utils.showToast(StringConstant.errorLabel);
      }
    }).catchError((error) {
      EasyLoading.dismiss();
      Utils.showToast(error.toString());
    });
  }

  ///refresh token
  Future<void> refreshToken() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    final preference = PreferenceUtil.getInstance();
    final mobile = preference.getValue<String>(PreferenceKey.mobile.name) ?? "";
    final mpin = preference.getValue<String>(PreferenceKey.mpin.name) ?? "";

    final model = RefreshTokenRequest(mobile: mobile, mpin: mpin);
    repository.refreshToken(model).then((value) async {
      EasyLoading.dismiss();
      refreshTokenResponse.value = value!;

      if (refreshTokenResponse.value!.status == true) {
        final preference = PreferenceUtil.getInstance();
        preference.putValue(PreferenceKey.mobile.name,
            refreshTokenResponse.value!.data!.mobile.toString());
        preference.putValue(PreferenceKey.name.name,
            refreshTokenResponse.value!.data!.name.toString());
        preference.putValue(PreferenceKey.token.name,
            refreshTokenResponse.value!.token.toString());

        Get.offAndToNamed(Routes.bottomBar.name);
      } else {
        Utils.showToast(StringConstant.errorLabel);
      }
    }).catchError((error) {
      EasyLoading.dismiss();
      Utils.showToast(error.toString());
    });
  }
}
