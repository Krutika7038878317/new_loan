import 'package:customerloan/provider/home_provider.dart';
import 'package:customerloan/repository/home_repository.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeProvider());
    Get.lazyPut(() => HomeRepository(provider: Get.find()));
    Get.lazyPut(() => HomeController(repository: Get.find()));
  }
}
