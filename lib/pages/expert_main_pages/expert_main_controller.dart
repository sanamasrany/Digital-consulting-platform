import 'dart:io';

import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/reservedTime.model.dart';
import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:digital_consulting_platform/pages/expert_main_pages/expert_main_service.dart';
import 'package:get/get.dart';

import '../../models/expert_profile_details.dart';

class ExpertMainPageController extends GetxController{

  List<Reservedtime> expertAppoList = [];

   Expert expertdetails = Expert(id: 0, name: "name", email: "email", imgpath: "null", phonenumber: "0911221111", address: "address", valueOfRating: 0.0, userId: 0, experinces: "experinces", wallet: 0, createdAt: DateTime.now(), updatedAt: DateTime.now(),
       time: Time(id: 0, sundayS: "sundayS", sundayE: "sundayE", mondayS: "mondayS", mondayE: "mondayE", tuesdayS: "tuesdayS", tuesdayE: "tuesdayE", wednesdayS: "wednesdayS", wednesdayE: "wednesdayE", thursdayS: "thursdayS", thursdayE: "thursdayE", expertId: 0, createdAt: DateTime.now(), updatedAt: DateTime.now())) ;

  var loading = true.obs;
  var logoutStatus = false;
  var coverttouserStatus = false;

  var message ;
 // var token;

  ExpertMainPageService _service = ExpertMainPageService();
  @override
  void onInit() {

    super.onInit();
  }
  @override
  void onReady()async {
    print("enteron ready");

    expertAppoList = await _service.GetReservedtime(UserInformation.expert_id );
    expertdetails = await _service.getexpertprofile( UserInformation.expert_token ); // returns t or f


    loading(false);
    super.onReady();
  }
  Future<void> logoutOnClick( ) async{

    logoutStatus = await _service.logout( UserInformation.expert_token ); // returns t or f
    message = _service.message;

    // if the back sends me a msg as a list so i can make it a string
    if (message is List ){
      String fix ='';
      for(String m in message) {
        fix +=m+ '\n';
      }
      message = fix;

    }

  }

Future<void> convertToUser ()async {
    print(UserInformation.expert_id);
    coverttouserStatus = await _service.converttouserapi(UserInformation.expert_id.toString());
    message = _service.message;



    // if the back sends me a msg as a list so i can make it a string
    if (message is List ){
      String fix ='';
      for(String m in message) {
        fix +=m+ '\n';
      }
      message = fix;

    }
}



  var isprofilpicset = false.obs;
  var profilePicPath = "".obs;



  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isprofilpicset.value = true;
  }

  var editStatus = false;
  late  String name =expertdetails.name ;
  late String email = expertdetails.email;
  late String phonenumber = expertdetails.phonenumber;
  late String address = expertdetails.address;
  late String experinces = expertdetails.experinces;
  String password = UserInformation.user_password;
  Future<void> editOnClick( String image) async{

    editStatus = await _service.editexpert(UserInformation.expert_token, name, email,
        phonenumber, password, address, experinces, image);
    message = _service.message;




    // if the back sends me a msg as a list so i can make it a string
    if (message is List ){
      String fix ='';
      for(String m in message) {
        fix +=m+ '\n';
      }
      message = fix;

    }

  }

}
