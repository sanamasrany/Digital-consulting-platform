
import 'package:digital_consulting_platform/pages/signup_expert/signup_ex_controller.dart';
import 'package:get/get.dart';

class signupEXbinding extends Bindings {
  @override
  void dependencies() {
    Get.put<signupEXController>(signupEXController());
  }

}