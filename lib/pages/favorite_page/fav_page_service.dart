import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/models/Fav_list.dart';
import 'package:http/http.dart' as http;

class FAVpageService {
  var urlFavLIST =Uri.parse('${ServerConfig.domainNameserver}/api/getlistfavourite');


  Future<List<Favlist>> Favorits(String id ) async {
    var response = await http.post(urlFavLIST,
      body: {
        'id' : id,
      },
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = favoretlistFromJson(response.body);
      // return experts.experts
     // print(repla);
      return replay.favlist  ;
    }
    else{
      return [];
    }
  }
}