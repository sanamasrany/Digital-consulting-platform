import 'package:digital_consulting_platform/pages/signin/signin_controller.dart';
import 'package:get/get.dart';

class signupuserbinding extends Bindings {
  @override
  void dependencies() {
    Get.put<signinController>(signinController());
  }

}