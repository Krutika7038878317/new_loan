import 'dart:async';
import 'package:customerloan/route/routes.dart';
import 'package:customerloan/util/preference_util.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => {redirect()});

    super.onInit();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final preference = PreferenceUtil.getInstance();
    final isLoggedIn = preference.getValue<String>(PreferenceKey.isLoggedIn.name) ?? "false";

    print("isLoggedIn");
    print(isLoggedIn);
    if(isLoggedIn=="true")
      {
        Get.offAndToNamed(Routes.login.name);
      }
    else
      {
        Get.offAndToNamed(Routes.slider.name);
      }


  }
}
