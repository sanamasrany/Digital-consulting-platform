import 'package:digital_consulting_platform/pages/reserved_user_page/reserved_user_controller.dart';
import 'package:get/get.dart';

class ReservedUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReservedUserController>(ReservedUserController());
  }

}