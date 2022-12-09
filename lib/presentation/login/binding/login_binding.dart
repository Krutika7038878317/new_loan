import 'package:customerloan/presentation/login/controller/login_controller.dart';
import 'package:customerloan/provider/login_provider.dart';
import 'package:customerloan/repository/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider());
    Get.lazyPut(() => LoginRepository(provider: Get.find()));
    Get.lazyPut(() => LoginController(repository: Get.find()));
  }
}
