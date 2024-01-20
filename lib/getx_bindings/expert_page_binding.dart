
import 'package:digital_consulting_platform/pages/expert_page/expert_page_controller.dart';
import 'package:get/get.dart';

class ExpertPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<ExpertPageController>(ExpertPageController());
  }
}