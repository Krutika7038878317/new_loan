import 'package:customerloan/presentation/registraion_page/controller/registration_controller.dart';
import 'package:customerloan/provider/registration_provider.dart';
import 'package:get/get.dart';

import '../../../repository/registration_repository.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationProvider());
    Get.lazyPut(() => RegistrationRepository(provider: Get.find()));
    Get.lazyPut(() => RegistrationController(repository: Get.find()));
  }
}
