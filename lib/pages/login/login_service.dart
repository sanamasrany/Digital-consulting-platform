import 'dart:convert';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/user.dart';
import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:digital_consulting_platform/pages/login/login.dart';
//import 'package:http/http.dart' as http ;
import 'package:dio/dio.dart' ;
// future bool is cause of async makes the program wait till this fun ends so it cant be boo
class LoginService {
  var message;
var token;

  String userID='' ;

  var type;
var dio = Dio();
  //var url = Uri.parse(ServerConfig.domainNameserver + ServerConfig.login);
  var url = Uri.parse('${ServerConfig.domainNameserver}/api/login');
  Future<bool> login (var email, var password ,bool ceckbox) async { // async and await for making any comand after wait till this ends
try {
  var response = await dio.post(url.toString(),
      // headers: {
      //  'Accept' : 'application/json',
      //  },
      data: {
        'email': email,
        'password': password,
      }
  );

  print(response.statusCode);
  print(response.data.toString());
  if (response.statusCode == 200) {
    // Map replay = jsonDecode(response.data);
    Map replay = response.data;
    message = replay['message'];
    token = replay['token'];
    userID = replay['id'].toString();
    type = replay['type'];

    UserInformation.user_type = type;
    UserInformation.user_password = password;

    if (type == 'expert'){
      UserInformation.expert_id = userID;
      UserInformation.expert_token = token;
      print(UserInformation.expert_token);
      print(UserInformation.expert_id);
    }
    else {
      UserInformation.user_id = userID;
      UserInformation.user_token = token;
      print(UserInformation.user_token);
      print(UserInformation.user_id);
    }

    print(UserInformation.user_type);
    print( UserInformation.user_password);

    if (ceckbox) {
      //save token to device
      SecureStorage storage = SecureStorage();
      if (UserInformation.user_type == 'expert'){
        await storage.save('experttoken', UserInformation.expert_token);
        await storage.save('expertID', UserInformation.expert_id);
      }
      else {
        await storage.save('token', UserInformation.user_token);
        await storage.save('userID', UserInformation.user_id);
      }
      await storage.save('userPassword', UserInformation.user_password);
    }
    return true;
  } else if (response.statusCode == 422) {
    // Map replay = jsonDecode(response.data);
    Map replay = response.data;
    message = replay['message'];
    return false;
  } else {
    return false;
  }
} catch (e){
  print(e.toString());
  return false;
}
    //return true ;

  }

}