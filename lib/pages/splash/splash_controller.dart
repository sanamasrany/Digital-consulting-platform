

import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:digital_consulting_platform/pages/splash/nextsplash.dart';
import 'package:digital_consulting_platform/pages/splash/splash_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  late SecureStorage _storage;
  late bool valid ;
  late SplashService _service; //_ means private
@override
  void onInit() async{  // starts as soon as the controller is created
  valid = false;
  _service = SplashService();
     _storage = SecureStorage(); //for making sure if it works

     await checkToken();
    super.onInit();
  }
  @override
  void onReady() {

    super.onReady();
  }
  Future<void> checkToken ()async {
    // i will give the api a token and he will tell me it its valid or not
    var token = await _storage.read('token');
    //var userID = await _storage.read('userID');
    var experttoken = await _storage.read('experttoken');
    var expertID = await _storage.read('expertID');
    //var userstatus = await _storage.read('userStatus');
    var userType = await _storage.read('userType');

    if (token != null) {
      await validtoken(token);
      if (valid) {
        UserInformation.user_token = token;
      //  UserInformation.user_id = userID!;
       // UserInformation.user_type = userType!;
       // UserInformation.user_status = userstatus!;
        print(UserInformation.user_type);
        print(UserInformation.user_token);
        print(UserInformation.user_id);

        print(UserInformation.user_status );
          Get.offAllNamed('/mainpage');


      }
      else{
        Get.offNamed('/login');
      }
    } else if (experttoken != null) {
      await validtokenex(experttoken);
      if (valid) {
        UserInformation.expert_token = experttoken;
        UserInformation.expert_id = expertID!;
        UserInformation.user_type = userType!;
       // UserInformation.user_status = userstatus!;

        print(UserInformation.expert_token);
        print(UserInformation.expert_id.toString());
        print(UserInformation.user_type.toString());
        print(UserInformation.user_status );
        Get.offAllNamed('/Expertmain');
      }
      else{
        Get.offNamed('/login');
      }


    } else {
      // EasyLoading.showError(_service.message);
      Get.offNamed('/login');
    }
  }

  Future<void> validtoken (String token) async{
 valid = await _service.CheckValid(token);

  }

  Future<void> validtokenex (String experttoken) async{
    valid = await _service.CheckValid(experttoken);

  }

}