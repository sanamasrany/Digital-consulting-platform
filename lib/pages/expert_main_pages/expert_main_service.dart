import 'dart:convert';
import 'dart:io';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/expert_profile_details.dart';
import 'package:digital_consulting_platform/models/reservedTime.model.dart';
import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:http/http.dart' as http;


class ExpertMainPageService {
  var expertdet;

  var message;


  var urlReservedtime = Uri.parse('${ServerConfig.domainNameserver}/api/getreservedtime');
  var urllogout = Uri.parse('${ServerConfig.domainNameserver}/api/logout');
  var urlprofiledetails = Uri.parse('${ServerConfig.domainNameserver}/api/profiledetails');
  var urlconverttouser = Uri.parse('${ServerConfig.domainNameserver}/api/converttouser');
  var urleditexpert = Uri.parse('${ServerConfig.domainNameserver}/api/editprofile');

  Future<List<Reservedtime>> GetReservedtime(String id) async {
    var response = await http.post(urlReservedtime,
      body: {
        'id': id,
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      // var replay = jsonDecode(response.body);
      var replay = expertReservedFromJson(response.body);

      return replay.reservedtime;
    }
    else {
      return [];
    }
  }

  Future<bool> logout(String token) async {
    var response = await http.post(urllogout,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },

    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var replay = jsonDecode(response.body);
      message = replay['message'];
      return true;
    }

    else {
      message = 'server error ';
      return false;
    }
  }


  Future<Expert> getexpertprofile(String token) async {
    var response = await http.get(urlprofiledetails,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },

    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var replay = expertProfileFromJson(response.body);

      return replay.expert;
    }

    else {
      return Expert(id: 0,
          name: 'name',
          email: 'email',
          imgpath: 'null',
          phonenumber: 'phonenumber',
          address: 'address',
          valueOfRating: 0,
          userId: 0,
          experinces: 'experinces',
          wallet: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          time: Time(id: 0,
              sundayS: 'sundayS',
              sundayE: 'sundayE',
              mondayS: 'mondayS',
              mondayE: 'mondayE',
              tuesdayS: 'tuesdayS',
              tuesdayE: 'tuesdayE',
              wednesdayS: 'wednesdayS',
              wednesdayE: 'wednesdayE',
              thursdayS: 'thursdayS',
              thursdayE: 'thursdayE',
              expertId: 0,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()));
    }
  }

  var token;
  var userid;

  Future<bool> converttouserapi(String id) async {
    var response = await http.post(urlconverttouser,

        body: {
          'id': id,
        }
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      var replay = jsonDecode(response.body);
      message = replay['message'];
      token = replay['token'];
      userid = replay['user']['id'].toString();

      UserInformation.user_status = 'true';

      UserInformation.user_token = token;
      UserInformation.user_type = "user";
      UserInformation.user_id = userid.toString();
      print(UserInformation.user_token);
      print(UserInformation.user_type);
      SecureStorage storage = SecureStorage();
      await storage.save('token', UserInformation.user_token);
      await storage.save('userType', UserInformation.user_type);
      await storage.save('userID', UserInformation.user_id);
      await storage.save('userStatus', UserInformation.user_status);
      return true;
    }

    else {
      message = 'server error ';
      return false;
    }
  }
var token2;
  Future<bool> editexpert(String token, String name, String email,
      String phonenumber,
      String password, String address, String experinces, String imagepath) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST',urleditexpert);
    request.fields.addAll({
      'name': name,
      'email': email,
      'phonenumber': phonenumber,
      'password': password,
      'address': address,
      'experinces': experinces
    });
    request.files.add(await http.MultipartFile.fromPath('imgpath', imagepath));
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {

      var replay = jsonDecode(response.body);
      message = replay['message'];
      token2 = replay['token'];
      // newuserdet = replay['user'];

      UserInformation.expert_token = token2;
      SecureStorage storage = SecureStorage();
      await storage.save('experttoken', UserInformation.expert_token);
      return true;

    }
    if(response.statusCode == 422){
      var replay = jsonDecode(response.body);
      message = replay['message'].toString();
      return false ;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }
}