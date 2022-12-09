import 'package:customerloan/constant/asset_path_constant.dart';
import 'package:customerloan/presentation/splash/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SplashScreenController>(),
      builder: (controller) => Scaffold(
        body: Scaffold(
            body: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: <Widget>[
                Image.asset(
                  AssetPathConstant.splashScreen,

                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  AssetPathConstant.logoIcons,
                  height: 200,
                ),
              ],
            )),
      ),
    );
  }
}
