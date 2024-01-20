import 'dart:convert';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/models/chat_list_model.dart';
import 'package:digital_consulting_platform/models/chat_list_user_view_model.dart';
import 'package:digital_consulting_platform/models/messages_chat_model.dart';
import 'package:http/http.dart' as http;

class ChatPageService {
  var   urlgetchats =Uri.parse('${ServerConfig.domainNameserver}/api/getchats');
  var urlgetchatmessages = Uri.parse('${ServerConfig.domainNameserver}/api/getmessagesofchat');
var urlsend =Uri.parse('${ServerConfig.domainNameserver}/api/send');

  Future<List<Chat>> getChats(String userid , String expertid ) async {
    var response = await http.post(urlgetchats,
      body: {
        'userid' : userid,
        'expertid' :expertid

      }
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = chatListFromJson(response.body);
      // return experts.experts;
      return replay.chat  ;
    }
    else{
      return [];
    }
  }

  Future<List<ChatUser>> getChatsUserView(String userid , String expertid ) async {
    var response = await http.post(urlgetchats,
        body: {
          'userid' : userid,
          'expertid' :expertid

        }
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = chatListUserViewFromJson(response.body);
      // return experts.experts;
      return replay.chat  ;
    }
    else{
      return [];
    }
  }
var messagesChat ;
  Future<bool> GetMessageofChat(String chatid  ) async {
    var response = await http.post(urlgetchatmessages,
        body: {
          'chatid' : chatid,


        }
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      // var replay = jsonDecode(response.body);
      var replay = chatMessagesFromJson(response.body);
      messagesChat = replay.messagesofchat;
      return true  ;
    }
    else{
      return false;
    }
  }
//var message;
  Future<bool> sendmessageapi(String userid, String expertid,String fromu,String frome,String message ) async {
    var response = await http.post(urlsend,
        body: {
          'userid' : userid,
          'expertid' : expertid,
          'fromu' : fromu,
          'frome' : frome,
          'message' : message,


        }
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var replay = jsonDecode(response.body);
      //message = replay['message'];

      return true  ;
    }
    else{
      return false;
    }
  }
}