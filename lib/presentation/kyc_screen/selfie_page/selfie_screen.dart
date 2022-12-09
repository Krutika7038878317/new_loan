import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/presentation/bottombar_page/home/controller/home_controller.dart';
import 'package:customerloan/presentation/kyc_screen/selfie_page/selfie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelfieScreen extends StatelessWidget {
  const SelfieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelfieController>(
      init: Get.find<SelfieController>(),
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: controller.controllerCamera?.buildPreview(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.15,
              left: MediaQuery.of(context).size.width / 2.5,
              child: ElevatedButton(
                onPressed: () {
                  controller.takePicture();
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(30),
                ),
                child: const Text('Click Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
