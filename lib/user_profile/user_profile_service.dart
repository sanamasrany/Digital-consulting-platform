import 'dart:convert';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/user_profile_details_model.dart';
import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:http/http.dart' as http;

class userprofileService {

  var urllogout =Uri.parse('${ServerConfig.domainNameserver}/api/logout');
  var urlprofiledetails =Uri.parse('${ServerConfig.domainNameserver}/api/profiledetails');
  var urledituser = Uri.parse('${ServerConfig.domainNameserver}/api/editprofile');

  var token ;
  var newuserdet ;
  var message;

  Future<bool> logout (String token) async{
    var response = await http.post(urllogout,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      var replay = jsonDecode(response.body);
      message =replay['message'];
      return true ;
    }


    else {
      message ='server error ';
      return false;
    }

  }


  Future<User> getuserprofile (String token) async{
    var response = await http.get(urlprofiledetails,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      var replay = userProfileFromJson(response.body);

      return replay.user ;
    }

    else {

      return User(id: 0, name: 'name', email: 'email', phonenumber: 'phonenumber', wallet: 0, createdAt: DateTime.now(), updatedAt: DateTime.now());
    }

  }

  Future<bool> edituser (String token , String name , String email,String phonenumber ,String password) async{
    var response = await http.post(urledituser,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: {
      'name':name,
        'email':email,
        'phonenumber':phonenumber,
        'password':password,


      }

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 201){
      var replay = jsonDecode(response.body);
      message = replay['message'];
      token = replay['token'];
     // newuserdet = replay['user'];

      UserInformation.user_token = token;
      SecureStorage storage = SecureStorage();
      await storage.save('token', UserInformation.user_token);


      return  true;
    }
    if(response.statusCode == 422){
      var replay = jsonDecode(response.body);
      message =replay['message'].toString();
      return false ;
    }

    else {

      return false;
    }

  }


}