
import 'package:customerloan/presentation/kyc_screen/selfie_page/selfie_controller.dart';
import 'package:get/get.dart';

import '../../../provider/selfie_provider.dart';
import '../../../repository/selfie_repository.dart';

class SelfieBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SelfieProvider());
    Get.lazyPut(() => SelfieRepository(provider: Get.find()));
    Get.lazyPut(() => SelfieController(repository: Get.find()));
  }

}