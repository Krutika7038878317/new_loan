import 'dart:io';
import 'package:customerloan/repository/qr_repository.dart';
import 'package:customerloan/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrController extends GetxController {
  QrController({required this.repository});

  final QrRepository repository;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  RxString? cc = "".obs;

  @override
  void reassemble() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;

      cc!.value = scanData.code.toString();
      print("cc!.valuecc!.valuecc!.value");
      print(cc!.value);

      if(result!=null)
        {
          Get.offAndToNamed(Routes.webview.name);

        }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
