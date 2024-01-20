import 'dart:convert';



import 'package:digital_consulting_platform/models/Fav_list.dart';
import 'package:digital_consulting_platform/models/business_model.dart';
import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/models/family_model.dart';
import 'package:digital_consulting_platform/models/medical_model.dart';
import 'package:digital_consulting_platform/models/psychological_model.dart';
import 'package:digital_consulting_platform/models/reservedTime.model.dart';
import 'package:digital_consulting_platform/models/toprated_model.dart';
import 'package:digital_consulting_platform/models/vocational_model.dart';
import 'package:get/get.dart';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;

//import '../../models/expertmainpage.dart';
class MainPageService {
  var message;
var newrate;

  //var url = Uri.parse(ServerConfig.domainNameserver + ServerConfig.getexperts);
  var url = Uri.parse('${ServerConfig.domainNameserver}/api/expertdetails');
  var urlmedical = Uri.parse('${ServerConfig.domainNameserver}/api/medical');
  var urlvocational = Uri.parse('${ServerConfig.domainNameserver}/api/vocational');
  var urlPsychological = Uri.parse('${ServerConfig.domainNameserver}/api/psychological');//
  var urlfamily = Uri.parse('${ServerConfig.domainNameserver}/api/family');
  var urlbusiness = Uri.parse('${ServerConfig.domainNameserver}/api/business');
  var urltop = Uri.parse('${ServerConfig.domainNameserver}/api/highrating');
  var urlchickrate =Uri.parse('${ServerConfig.domainNameserver}/api/checkisrated');
  var   urlchickfavourite =Uri.parse('${ServerConfig.domainNameserver}/api/checkfavourite');



  Future<List<Expert>> getExperts(String token ) async {
    var response = await http.get(url,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
     // var replay = jsonDecode(response.body);
      var replay = expertsFromJson(response.body);
    // return experts.experts;
     return replay.experts  ;
    }
    else{
      return [];
    }
  }

  Future<List<MedicalElement>> medical(String token ) async {
    var response = await http.get(urlmedical,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = medicalFromJson(response.body);
      // return experts.experts;
      return replay.medical ;
    }
    else{
      return [];
    }
  }

  Future<List<VocationalElement>> vocational(String token ) async {
    var response = await http.get(urlvocational,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = vocationalFromJson(response.body);
      // return experts.experts;
      return replay.vocational ;
    }
    else{
      return [];
    }
  }
  Future<List<PsychologicalElement> > psychological(String token ) async {
    var response = await http.get(urlPsychological,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = psychologicalFromJson(response.body);
      // return experts.experts;
      return replay.psychological ;
    }
    else{
      return [];
    }
  }

  Future<List<FamilyElement> > family(String token ) async {
    var response = await http.get(urlfamily,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = familyFromJson(response.body);
      // return experts.experts;
      return replay.family ;
    }
    else{
      return [];
    }
  }

  Future<List<BusinessElement> > business(String token ) async {
    var response = await http.get(urlbusiness,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = businessFromJson(response.body);
      // return experts.experts;
      return replay.business ;
    }
    else{
      return [];
    }
  }
  Future<List<Top10>> top(String token ) async {
    var response = await http.get(urltop,
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = topratedFromJson(response.body);
      // return experts.experts;
      return replay.top10 ;
    }
    else{
      return [];
    }
  }

  Future<List<Expert>> getExpertsSearch(String searchname ) async {
    var response = await http.get(Uri.parse('${ServerConfig.domainNameserver}/api/searchall/${searchname}'),
      // headers: {
      //   'Accept' : 'application/json',
      //   'Authorization': 'Bearer $token'
      // },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==201){
      // var replay = jsonDecode(response.body);
      var replay = expertsFromJson(response.body);
      // return experts.experts;
      return replay.experts  ;
    }
    else{
      return [];
    }
  }

  Future<bool> checkisrated(String id , String expertid) async {
    var response = await http.post(urlchickrate,
      body: {
        'id' : id,
        'expertid' : expertid,
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var replay = jsonDecode(response.body);
      if (replay['wasrated'] ==true ){
        newrate = replay['value'];
        return true;
      }
      else {
        return false  ;
      }

    }
    else{
      return false;
    }
  }

  Future<bool> checkfavourite(String id , String expertid) async {
    var response = await http.post(urlchickfavourite,
      body: {
        'id' : id,
        'expertid' : expertid,
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var replay = jsonDecode(response.body);
      if (replay['wasfavourite'] ==true ){

        return true;
      }
      else {
        return false  ;
      }

    }
    else{
      return false;
    }
  }



  // Future<List<Favlist>> Favorits(String id ) async {
  //   var response = await http.post(urlFavLIST,
  //     body: {
  //       'id' : id,
  //     },
  //   );
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if(response.statusCode==200){
  //     // var replay = jsonDecode(response.body);
  //     var replay = favoretlistFromJson(response.body);
  //     // return experts.experts
  //     //print(replay.favlist[1].expert.name);
  //     return replay.favlist  ;
  //   }
  //   else{
  //     return [];
  //   }
  // }

}