import 'package:get/get.dart';

import '../controller/my_bills_page_controller.dart';

class MyBillsPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyBillsPageController());
  }
}
