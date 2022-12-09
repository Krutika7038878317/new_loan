import 'package:get/get.dart';

import '../controller/contact_us_page_controller.dart';

class ContactUsPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsPageController());
  }

}