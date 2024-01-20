
import 'package:digital_consulting_platform/user_profile/user_profile_controller.dart';
import 'package:get/get.dart';

class UserProfileBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<UserProfileController>(UserProfileController());
  }
}