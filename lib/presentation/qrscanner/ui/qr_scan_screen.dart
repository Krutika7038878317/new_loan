import 'package:customerloan/presentation/qrscanner/controller/qr_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrController>(
      init: Get.find<QrController>(),
      builder: (controllerr) =>(
      Scaffold(
        body:
         Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: controllerr.qrKey,
                  onQRViewCreated: controllerr.onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child:
                  Center(
                    child: (controllerr.result != null)
                        ? Text(
                        'Barcode Type: ${describeEnum(controllerr.result!.format)}   Data: ${controllerr.cc!.value}')
                        : Text(''),
                  ),
                ),

            ],
          ),
        )
      )
    );
  }
}


