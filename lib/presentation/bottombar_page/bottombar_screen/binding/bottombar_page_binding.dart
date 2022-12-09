import 'package:get/get.dart';

import '../controller/bottombar_page_controller.dart';

class BottomBarPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarPageController());
  }

}