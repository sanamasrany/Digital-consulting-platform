import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/user_profile_details_model.dart';

import 'package:digital_consulting_platform/user_profile/user_profile_service.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {

late  User userdet  ;

var logoutStatus = false;
var message ;

var loadingu = true.obs;
userprofileService _service = userprofileService();

@override
void onInit() {

  super.onInit();
}
@override
void onReady()async {
  print("enteron ready");


  userdet = await _service.getuserprofile( UserInformation.user_token ); // returns t or f

loadingu(false);

  super.onReady();
}



  Future<void> logoutOnClick( ) async{

    logoutStatus = await _service.logout( UserInformation.user_token ); // returns t or f
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
var editStatus = false;
//late User newuserdetails ;

late  String name =userdet.name ;
  late String email = userdet.email;
  late String phonenumber = userdet.phonenumber;
   String password = UserInformation.user_password;
Future<void> editOnClick( ) async{

  editStatus = await _service.edituser(UserInformation.user_token, name, email, phonenumber, password); // returns t or f
  message = _service.message;
  //newuserdetails =_service.newuserdet;



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