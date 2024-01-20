import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/models/reserved_time_user_model.dart';
import 'package:http/http.dart' as http;

class ReservedUserService {

  var url = Uri.parse('${ServerConfig.domainNameserver}/api/getreservedtimeforuser');

  Future<List<Reservedtime>> getReservedUser(String userid ) async {
    var response = await http.post(url,
      body: {
        'userid' : userid,
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = reservedTimeuUserFromJson(response.body);
      // return experts.experts;
      return replay.reservedtime  ;
    }
    else{
      return [];
    }
  }
}