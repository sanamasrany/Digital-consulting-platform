


import 'package:digital_consulting_platform/pages/expert_main_pages/expert_main_controller.dart';
import 'package:get/get.dart';

class ExpertMainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertMainPageController>(ExpertMainPageController());
  }

}