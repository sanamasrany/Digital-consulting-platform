import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:http/http.dart' as http ;
class SplashService {
  var message ;
  //var url = Uri.parse(ServerConfig.domainNameserver + ServerConfig.signup);
  var url = Uri.parse('${ServerConfig.domainNameserver}/api/isvalid');

  Future<bool> CheckValid (String token) async{
    var response = await http.post(url,
        headers: {
          'Accept' : 'application/json',
          'Authorization': 'Bearer $token'
        },

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){

      return true ;
    }
    else if (response.statusCode == 401){
      message ='unable to enter , login please ';
      return false;
    }
 else {
      message ='server error ';
      return false;
    }

  }
  }


