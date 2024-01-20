import 'dart:ui';

import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/pages/expert_page/expert_page_service.dart';
import 'package:get/get.dart';

class ExpertPageController extends GetxController{
  // List<List<String>> DAYlist =[];
  // var cost =1;
  var favexpert = {}.obs;

  void addtofav (Expert expert ){
    favexpert[expert] = 1 ;


  }
  var refreshrate =false.obs ;

  var clientrate =0.5.obs ;

var sendrateStatus =false ;
var addfavStatus=false;

  ExperPageService _service = ExperPageService();
var newrate = 0.0.obs;


  @override
  void onReady() {
    // TODO: implement onReady

   // loading(false);
    super.onReady();
  }
  Future<void> sendrate(String id , String value  ) async {
    print(id);
    print(UserInformation.user_id);
    print(value);

    sendrateStatus = await _service.rate( UserInformation.user_id,id , value );

    newrate.value = _service.newrate;



  }
  var message;
  Future<void> AddToFav(String id  ) async {
    print(id);
    print(UserInformation.user_id);

    addfavStatus = await _service.addtofav( UserInformation.user_id,id );

    message = _service.messagefav;



  }

var makechatStatus = false;
  var chatidcon ;
  Future<void> makechat( String expertid) async {
    print(expertid);
    print(UserInformation.user_id);

    makechatStatus = await _service.makechat(UserInformation.user_id , expertid );

    message = _service.messagechat;
    chatidcon = _service.chatid;
    print(chatidcon);



  }



}

class DaylistPageController extends GetxController{
  //var id  ;
  var num =0.obs;
  var mcolor = secondBackColor.obs;
  var fcolor = secondBackColor.obs;
  var vcolor = secondBackColor.obs;
  var pcolor = secondBackColor.obs;
  var bcolor = secondBackColor.obs;
  var Scolor = secondBackColor.obs;

  var bookcolor = true.obs;

  var message ;

  var listStatus = false;
  var bookingStatus=false;

  List<List<String>> DAYlist =[];
  var cost ;

  var selectedday='1'.obs ;
  var loading = true.obs;

  ExperPageService service = ExperPageService();

  @override
  void onReady() {
    // TODO: implement onReady

  // Daytimelist(id, num);
   // loading(false);


    super.onReady();
  }



Future<void> Daytimelist(String id) async {
    print(id);
    print(num);
    print(selectedday.value.toString());
  listStatus = await service.dayList(id,num.value.toString() ,selectedday.value.toString());
  cost =  service.cost ;
  DAYlist = service.daylist;
    print(cost);
    print(DAYlist);
  loading(false);
  // loading(false);
}

  Future<void> bookasession(String id , String st , String en , String num , String selectedday ) async {
    print(id);
    print(UserInformation.user_id);
    print(num);
    print(selectedday);
    print(st);
    print(en);
   bookingStatus = await service.BookSession(st, en, selectedday, id, UserInformation.user_id, num);

    message = service.message;

    // if the back sends me a msg as a list so i can make it a string
    if (message is List ){
      String fix ='';
      for(String m in message) {
        fix +=m+ '\n';
      }
      message = fix;

    }
    loading(false);
    // loading(false);
  }



}

