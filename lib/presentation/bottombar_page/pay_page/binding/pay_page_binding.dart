import 'package:get/get.dart';

import '../controller/pay_page_controller.dart';

class PayPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PayPageController());
  }

}