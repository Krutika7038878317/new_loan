import 'package:customerloan/common/widgets/custom_appbar.dart';
import 'package:customerloan/constant/asset_path_constant.dart';
import 'package:customerloan/constant/color_constant.dart';
import 'package:customerloan/presentation/qrscanner/controller/qr_controller.dart';
import 'package:customerloan/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebviewScreen extends StatelessWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrController>(
      init: Get.find<QrController>(),
      builder: (controller) =>
          WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              backgroundColor: ColorConstant.appBackgroundColor,
              appBar: CustomAppBar(
                onPressed: () {
                   Get.offAndToNamed(Routes.qrscaner.name);
                   controller.refresh();
                },
                imagePath: AssetPathConstant.backIcon,
              ),
              body: SafeArea(
                child: webviewWidget(context, controller),
              ),
            ),
          ),
    );
  }


  Widget webviewWidget(BuildContext context, QrController controller) {
    return Obx(
          () =>
      controller.cc?.value.toString() != ""
          ? InAppWebView(
        initialUrlRequest:
        URLRequest(url: Uri.parse(controller.cc.toString())),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {},
        onLoadStart: (InAppWebViewController controller, Uri? url) {
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) async {
        },
        androidOnPermissionRequest: (InAppWebViewController controller,
            String origin, List<String> resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
      )
          : Container(
        color: ColorConstant.appBackgroundColor,
      ),
    );
  }

}
