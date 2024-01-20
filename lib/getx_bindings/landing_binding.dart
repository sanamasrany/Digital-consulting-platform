import 'package:digital_consulting_platform/pages/landing/landing_controller.dart';
import 'package:get/get.dart';

class landingBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<landingControoler>(landingControoler());
  }
}