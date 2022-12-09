import 'package:customerloan/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constant/asset_path_constant.dart';
import 'custom_appbar.dart';

class ConstantWebPage extends StatelessWidget {
  const ConstantWebPage({required this.url, required this.onPressed});
  final String url;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: onPressed,
        imagePath: AssetPathConstant.backIcon,
      ),
      body: SafeArea(
        child: Container(
          color: ColorConstant.appBackgroundColor,
          padding: const EdgeInsets.all(12),
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {},
            onLoadStart: (InAppWebViewController controller, Uri? url) {},
            onLoadStop: (InAppWebViewController controller, Uri? url) async {},
          ),
        ),
      ),
    );
  }
}
