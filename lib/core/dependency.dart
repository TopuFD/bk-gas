import 'package:bk_gas/controller/authe_controller.dart';
import 'package:get/get.dart';

class DependancyInjection extends Bindings {
  @override
  void dependencies() {
    //================= Auth ==================
    Get.lazyPut(() => AutheController());

    //================= Home Controller ==================

  
  }
}
