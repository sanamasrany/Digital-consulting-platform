import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/Fav_list.dart';
import 'package:digital_consulting_platform/pages/favorite_page/fav_page_service.dart';
import 'package:get/get.dart';

class FAVPageController extends GetxController{
  List<Favlist>  expertsListFav = [] ;
  var loading1 = true.obs;
  FAVpageService _service = FAVpageService();


  @override
  Future<void> onReady() async {

    expertsListFav = await _service.Favorits(UserInformation.user_id );

    loading1(false);
    super.onReady();
  }


}