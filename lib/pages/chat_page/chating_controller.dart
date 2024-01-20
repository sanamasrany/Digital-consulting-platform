import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/chat_list_model.dart';
import 'package:digital_consulting_platform/models/chat_list_user_view_model.dart';
import 'package:digital_consulting_platform/models/messages_chat_model.dart';
import 'package:digital_consulting_platform/pages/chat_page/chating_service.dart';
import 'package:get/get.dart';

class ChatPageController extends GetxController{

  String thesendmessage ='';

  List<Messagesofchat> messageofchatListcont =[];
  var messageofchatStatus = false;

  List<Chat> chatList = [];

  List<ChatUser> chatListUserView = [];

  var loading3 = true.obs;

  var loadingchats = true.obs;


  ChatPageService _service = ChatPageService();

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() async{

    if (UserInformation.user_type == "expert"){
      chatList = await _service.getChats('0', UserInformation.expert_id);

    }
    else{
      chatListUserView = await _service.getChatsUserView(UserInformation.user_id, '0');
    }

  loading3(false);
    super.onReady();
  }

 Future <void> GetThisChatMessage (String chatid ) async{
    messageofchatStatus = await _service.GetMessageofChat(chatid);
     messageofchatListcont = _service.messagesChat;
     print(messageofchatListcont);
    loadingchats(false);
  }

  var sendStatus = false;
  var message ;
  Future<void>  sendamessageExpert (String userid , String message)async
  {

    sendStatus = await _service.sendmessageapi(userid, UserInformation.expert_id, '0', '1', message);
   // message = _service.message;
  }

  Future<void>  sendamessageUser (String expertid , String message)async
  {

    sendStatus = await _service.sendmessageapi(UserInformation.user_id, expertid, '1', '0', message);
   // message = _service.message;
  }
}