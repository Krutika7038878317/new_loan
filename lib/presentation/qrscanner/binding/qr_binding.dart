import 'package:customerloan/presentation/login/controller/login_controller.dart';
import 'package:customerloan/presentation/qrscanner/controller/qr_controller.dart';
import 'package:customerloan/provider/login_provider.dart';
import 'package:customerloan/provider/qr_provider.dart';
import 'package:customerloan/repository/login_repository.dart';
import 'package:customerloan/repository/qr_repository.dart';
import 'package:get/get.dart';

class QrBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => QrProvider());
    Get.lazyPut(() => QrRepository(provider: Get.find()));
    Get.lazyPut(() => QrController(repository: Get.find()));
  }

}