import 'package:digital_consulting_platform/pages/login/login_controller.dart';
import 'package:get/get.dart';
// the binding i spetter to handel all the controllers i have so i can call it wherever
//so i can use the controller of a page in another one

class loginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<loginController>(loginController());
  }
}
