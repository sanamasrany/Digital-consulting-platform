import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/reserved_time_user_model.dart';
import 'package:digital_consulting_platform/pages/reserved_user_page/reserved_user_service.dart';
import 'package:get/get.dart';

class ReservedUserController extends GetxController {

  List<Reservedtime> reserveduserlist = [];

  ReservedUserService _service = ReservedUserService();

  var loading = true.obs;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() async{
    reserveduserlist = await _service.getReservedUser(UserInformation.user_id );


    loading(false);
    super.onReady();
  }
}