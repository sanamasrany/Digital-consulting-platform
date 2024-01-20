import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:digital_consulting_platform/pages/login/login_service.dart';
import 'package:get/get.dart';

class loginController extends GetxController{
  var email;
  var password ;
  var loginStatus ;
  var message;
  var checkBoxStatuse ;


late  LoginService service ;  // late so its not null you will see later

  @override
  void onInit() {
    email ='';
    password='';
    loginStatus= false;
    message='';
    checkBoxStatuse =false.obs;
    service = LoginService();
    super.onInit();
  }

  void changeCheckBox () {
    checkBoxStatuse(!checkBoxStatuse.value);
    print(checkBoxStatuse);

  }

  Future<void> loginOnClick( ) async{
  //  User user =User(name : name , email:email , password: password , passwordConfirm : passwordConfirm );
    loginStatus = await service.login(email, password , checkBoxStatuse.value) ;// returns t or f
    message = service.message;

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