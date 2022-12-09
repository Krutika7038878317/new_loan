import 'package:customerloan/presentation/login/controller/login_controller.dart';
import 'package:customerloan/presentation/mpin/controller/mpin_controller.dart';
import 'package:customerloan/provider/login_provider.dart';
import 'package:customerloan/provider/mpin_provider.dart';
import 'package:customerloan/repository/login_repository.dart';
import 'package:customerloan/repository/mpin_repository.dart';
import 'package:get/get.dart';

class MpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MpinProvider());
    Get.lazyPut(() => MpinRepository(provider: Get.find()));
    Get.lazyPut(() => MpinController(repository: Get.find()));
  }
}
