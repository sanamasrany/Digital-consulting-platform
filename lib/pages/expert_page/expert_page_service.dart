import 'dart:convert';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/models/day_model.dart';
import 'package:digital_consulting_platform/models/user.dart';
import 'package:http/http.dart' as http ;
// future bool is cause of async makes the program wait till this fun ends so it cant be boo
class ExperPageService {
  var cost ;
  var daylist;
  var newrate;

 // var url = Uri.parse(ServerConfig.domainNameserver + ServerConfig.signup);
var url = Uri.parse('${ServerConfig.domainNameserver}/api/getexperttime');
var urlBook = Uri.parse('${ServerConfig.domainNameserver}/api/reserve');
 var urlrate =Uri.parse('${ServerConfig.domainNameserver}/api/rate');
 var urladdtofav =Uri.parse('${ServerConfig.domainNameserver}/api/addtofavourite');

  var urlmakechat =Uri.parse('${ServerConfig.domainNameserver}/api/setchat');

Future<bool> dayList(String id , String num , String numday ) async {
  var response = await http.post(url,
    // headers: {
    //   'Accept' : 'application/json',
    //   'Authorization': 'Bearer $token'
    // },
    body: {
    'id' : id ,
    'num' : num,
      'numday':numday

    }
  );
  print(response.statusCode);
  print(response.body);

  if(response.statusCode==200){
    // var replay = jsonDecode(response.body);
    var replay = dayFromJson(response.body);
    // return experts.experts;
    cost = replay.cost;
    daylist = replay.day;

   // print(cost);
    //print(replay.day);


    return true ;
  }
  else{
    return false;
  }
}
var message;
  Future<bool> BookSession(String st , String en , String numday , String id , String iduser, String numofconsultaion) async {
    var response = await http.post(urlBook,
        // headers: {
        //   'Accept' : 'application/json',
        //   'Authorization': 'Bearer $token'
        // },
        body: {
      'st':st,
          'en':en,
          'numday':numday,
          'id' : id ,
          'iduser' : iduser,
          'numofconsultaion':numofconsultaion

        }
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var replay = jsonDecode(response.body);
      message =replay['message'];

      // print(cost);
      //print(replay.day);


      return true ;
    }
    else{
      return false;

    }
  }

  Future<bool> rate(String id , String expertid , String value) async {
    var response = await http.post(urlrate,
      body: {
        'id' : id,
        'expertid' : expertid,
        'value': value,
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var replay = jsonDecode(response.body);
        newrate = replay['value_of_rating'];
        return true;

    }
    else{
      return false;
    }
  }
var messagefav;
  Future<bool> addtofav(String id , String expertid ) async {
    var response = await http.post(urladdtofav,
      body: {
        'id' : id,
        'expertid' : expertid,

      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var replay = jsonDecode(response.body);
      messagefav = replay['message'];
      return true;

    }
    else{
      return false;
    }
  }
var messagechat ;
  var chatid ;
  Future<bool> makechat(String userid , String expertid ) async {
    var response = await http.post(urlmakechat,
      body: {
        'userid' : userid,
        'expertid' : expertid,

      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var replay = jsonDecode(response.body);
      messagechat = replay['message'];
      chatid = replay['chatid'];
      return true;

    }
    else{
      return false;
    }
  }

}