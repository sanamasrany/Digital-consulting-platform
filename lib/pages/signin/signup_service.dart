import 'dart:convert';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/user.dart';
import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:http/http.dart' as http ;
// future bool is cause of async makes the program wait till this fun ends so it cant be boo
class SignupService {
var message;

var token;

String userID='' ;

var type;

 // var url = Uri.parse(ServerConfig.domainNameserver + ServerConfig.signup);
var url = Uri.parse('${ServerConfig.domainNameserver}/api/registeruser');
 Future<bool> signup (User user) async { // async and await for making any comand after wait till this ends
     var response = await http.post(url,
     headers: {
    'Accept' : 'application/json',
     },
     body: {
       'name': user.name,
       'email': user.email,
       'password': user.password,
       'phonenumber': user.phonenumber,
     }
     );
     print(response.statusCode);
     print(response.body);
     if(response.statusCode == 201){
       var replay = jsonDecode(response.body);
       message =replay['message'];
       token = replay['token'];
       userID = replay['id'].toString();
       type = "user";

       UserInformation.user_type = type;
       UserInformation.user_password = user.password!;

         UserInformation.user_id = userID;
         UserInformation.user_token = token;
         print(UserInformation.user_token);
         print(UserInformation.user_id);


         //save token to device
         SecureStorage storage = SecureStorage();

           await storage.save('token', UserInformation.user_token);
           await storage.save('userID', UserInformation.user_id);

         await storage.save('userPassword', UserInformation.user_password);


       return true;
     }else if (response.statusCode == 400){
       var replay = jsonDecode(response.body);
       message =replay['message'];
       return false;
     }else {
       return false;
     }
   }
}