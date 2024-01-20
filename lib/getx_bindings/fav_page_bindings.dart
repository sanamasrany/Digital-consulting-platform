

import 'package:digital_consulting_platform/pages/favorite_page/fav_page_controller.dart';
import 'package:get/get.dart';

class FAVPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FAVPageController>(FAVPageController());
  }

}