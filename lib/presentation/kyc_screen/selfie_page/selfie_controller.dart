import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;

import '../../../provider/selfie_provider.dart';

class SelfieController extends GetxController {
  SelfieController({required this.repository});

  final SelfieProvider repository;

  ///camera
  List<CameraDescription> cameras = [];
  RxString selectedImagePath = "".obs;
  CameraController? controllerCamera;
  RxBool isSelfieClick = false.obs;

  @override
  Future<void> onInit() async {
    if (cameras != null) {
      cameras = await availableCameras();

      controllerCamera = CameraController(
          cameras[1], ResolutionPreset.ultraHigh,
          enableAudio: false);

      await controllerCamera?.initialize();
    }
    super.onInit();
  }

  /// camera takeSelfie
  Future<void> takePicture() async {
    XFile? xFile = await controllerCamera?.takePicture();

    if (xFile != null) {
      List<int> imageBytes = await xFile.readAsBytes();
      img.Image? originalImage = img.decodeImage(imageBytes);
      img.Image fixedImage = img.flipHorizontal(originalImage!);

      File file = File(xFile.path);

      File fixedFile = await file.writeAsBytes(
        img.encodeJpg(fixedImage),
        flush: true,
      );

      isSelfieClick.value = true;
      selectedImagePath.value = fixedFile.path;
      Get.back();
    }
  }
}
