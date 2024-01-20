import 'package:digital_consulting_platform/pages/main_page/main_page_controller.dart';
import 'package:get/get.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
   Get.put<MainPageController>(MainPageController());
  }

}