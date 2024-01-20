//
//
//
//
// import 'dart:convert';
//
// import 'package:digital_consulting_platform/config/server_config.dart';
// import 'package:digital_consulting_platform/models/expert.dart';
// import 'package:digital_consulting_platform/pages/signup_expert/signup_ex_controller.dart';
// import 'package:http/http.dart' as http ;
//  class SignupServiceEX {
//   signupEXController c = signupEXController();
// var message;
//   var url = Uri.parse(ServerConfig.domainNameserver + ServerConfig.signupexpert);
//   Future<bool>  signupEx (Expert expert) async { // async and await for making any comand after wait till this ends
//     var response = await http.post(url,
//         headers: {
//           'Accept' : 'application/json',
//         },
//         body: {
//           'name': expert.name,
//           'email': expert.email,
//           'password': expert.password,
//           'experinces':  expert.experinces,
//           'details' : expert.experinces,
//           'phoneNumber' : expert.phonenumber,
//           'address' : expert.address,
//            'starttime': expert.starttime,
//           'endtime': expert.endtime,
//           'duration': expert.duration,
//           'cost': expert.cost,
//         }
//     );
//
//     print(response.statusCode);
//     print(response.body);
//     if(response.statusCode == 200){
//       var replay = jsonDecode(response.body);
//       message =replay['message'];
//       return true;
//     }else if (response.statusCode == 422){
//       var replay = jsonDecode(response.body);
//       message =replay['message'];
//       return false;
//     }else {
//       return false;
//     }
//   }
// }