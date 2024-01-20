import 'package:digital_consulting_platform/pages/chat_page/chating_controller.dart';
import 'package:get/get.dart';

class ChatPageBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<ChatPageController>(ChatPageController());
  }
}