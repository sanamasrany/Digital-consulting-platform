import 'package:digital_consulting_platform/models/user.dart';
import 'package:digital_consulting_platform/pages/signin/signup_service.dart';
import 'package:get/get.dart';

class signinController extends GetxController {
  var name ='';
  var email='';
  var password='' ;
  var passwordConfirm='';
  var phonenumber = '';
  var signupStatus = false;
  var message;


  SignupService service = SignupService();


 Future<void> signupOnClick( ) async{
   User user =User(name : name , email:email , password: password , passwordConfirm : passwordConfirm, phonenumber: phonenumber );
 signupStatus = await service.signup( user ); // returns t or f
   message = service.message;

   // if the back sends me a msg as a list so i can make it a string
   if (message is List ){
     String fix ='';
     for(String m in message) {
       fix +=m+ '\n';
     }
     message = fix;

   }
   if(password != passwordConfirm){
     message = 'make sure of your password';
     signupStatus = false;
   }
 }

}
