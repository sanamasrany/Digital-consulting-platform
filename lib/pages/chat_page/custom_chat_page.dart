

import 'dart:async';

import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/models/messages_chat_model.dart';
import 'package:digital_consulting_platform/pages/chat_page/chating_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatPageState extends StatelessWidget{
  List<Messagesofchat> messageofchatList;
  String username ;
  String userid ;
  String chatid;
  ChatPageState(this.messageofchatList,this.username,this.userid,this.chatid);

  ChatPageController controller = Get.put(ChatPageController());


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: secondBackColor,
       title: Text(username),
       centerTitle: true,
     ),
     body:
         Container(
     decoration: gradientBackground,
    child: Obx (() {
      if (controller.loadingchats.isTrue) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      Timer(Duration(seconds: 10 ), () => {  onClickChat(context,chatid.toString(),username, userid),
        print("time to change ")

      });
      return
        Column(

          children: [
            Expanded(child: GroupedListView<Messagesofchat, DateTime>(
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              padding: EdgeInsets.all(8),
              elements: messageofchatList,
              groupBy: (messageofchatList) =>
                  DateTime(
                      messageofchatList.createdAt.year,
                      messageofchatList.createdAt.month,
                      messageofchatList.createdAt.day
                  ),
              groupHeaderBuilder: (Messagesofchat messageofchatList) =>
                  SizedBox(
                    height: 40,

                    child:
                    Center(
                      child:
                    Card(
                      color: firstBackColor,

                      child:
                      Container(

                        child:
                        Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(DateFormat.yMMMd().format(messageofchatList.createdAt),
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )),
                    )),
                  ),
              itemBuilder: (context, Messagesofchat messageofchatList) =>
                  Align(
                    alignment:
                    messageofchatList.fromExpert == 1
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(messageofchatList.message,
                        style: TextStyle(fontSize: 18),),
                      ),
                    ),
                  ),
            )

            ),
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Colors.grey.shade300,
                child:
                Row(
                  children: [
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .85,
                        child:
                        TextField(

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'Type your message here ...',

                          ),
                          onChanged: (text) {
                    controller.thesendmessage = text;
                          },
                        )),
                    IconButton(onPressed: () {
                      onClicksendExpert(context, controller.thesendmessage, userid, chatid , username);

                    }, icon: Icon(Icons.send, color: firstBackColor,))
                  ],
                )

            )
          ],
        );
    } )
    ),
   );
  }

  void onClicksendExpert(context ,String message, String userid,String chatid , String username ) async {
    ChatPageController c = ChatPageController();

    print(message);
    print(userid);
    print(chatid);
    print(username);
    EasyLoading.show(status: 'loading..',);
    

      await controller.sendamessageExpert(userid, message);
    await c.GetThisChatMessage(chatid);



    if(controller.sendStatus ) {
      if( c.messageofchatStatus){

        print(c.messageofchatListcont);


      EasyLoading.showSuccess(
          'success', duration: Duration(milliseconds: 10), dismissOnTap: true);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatPageState(c.messageofchatListcont,username,userid,chatid)));
    }

    }

    else{
      EasyLoading.showError(
          'error', duration: Duration(milliseconds: 10), dismissOnTap: true);
    }

  }
  void onClickChat(context, String chatid, String username,String userid) async {

    EasyLoading.show(status: 'loading..',
    );
    await controller.GetThisChatMessage(chatid); // prog cant do anything under till this fun ends
    if(controller.messageofchatStatus) {
      EasyLoading.showSuccess(
          'success', duration: Duration(milliseconds: 500), dismissOnTap: true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatPageState(controller.messageofchatListcont,username,userid,chatid)));

    }else{
      EasyLoading.showError(
          'error', duration: Duration(milliseconds: 500), dismissOnTap: true);
    }

  }
  // void onClicksendUser(context ,String message , String expertid) async {
  //
  //   EasyLoading.show(status: 'loading..',);
  //
  //   await controller.sendamessageUser(expertid, message);
  //
  //   if(controller.messageofchatStatus) {
  //     EasyLoading.showSuccess(
  //         controller.message, duration: Duration(milliseconds: 500), dismissOnTap: true);
  //
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatPageState(controller.messageofchatListcont,username)));
  //   }else{
  //     EasyLoading.showError(
  //         'error', duration: Duration(milliseconds: 500), dismissOnTap: true);
  //   }
  //
  // }

}



class ChatPageStateUserview extends StatelessWidget {
  List<Messagesofchat> messageofchatList;
  String expetname;

  String expertid;

  String chatid;

  ChatPageStateUserview(this.messageofchatList, this.expetname, this.expertid,
      this.chatid);

  ChatPageController controller = Get.put(ChatPageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondBackColor,
        title: Text(expetname),
        centerTitle: true,
      ),
      body:
      Container(
          decoration: gradientBackground,
          child: Obx(() {
            if (controller.loadingchats.isTrue) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            Timer(Duration(seconds: 10 ), () => {  onClickChatUserV(context, chatid.toString(), expetname, expertid.toString()),
              print("time to change ")

            });
            return
              Column(

                children: [
                  Expanded(child: GroupedListView<Messagesofchat, DateTime>(
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    useStickyGroupSeparators: true,
                    floatingHeader: true,
                    padding: EdgeInsets.all(8),
                    elements: messageofchatList,
                    groupBy: (messageofchatList) =>
                        DateTime(
                            messageofchatList.createdAt.year,
                            messageofchatList.createdAt.month,
                            messageofchatList.createdAt.day
                        ),
                    groupHeaderBuilder: (Messagesofchat messageofchatList) =>
                        SizedBox(
                          height: 40,

                          child:
                          Center(
                            child: Card(

                              color: firstBackColor,
                              child:
                              Container(

                                child:   Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(DateFormat.yMMMd().format(
                                      messageofchatList.createdAt),
                                    style: TextStyle(
                                        color: Colors.white
                                        , fontSize: 15
                                    ),
                                  ),
                                ),),

                            ),
                          )

                        ),
                    itemBuilder: (context, Messagesofchat messageofchatList) =>
                        Align(
                          alignment:
                          messageofchatList.fromUser == 1
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Card(
                            elevation: 8,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(messageofchatList.message,
                                style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),
                  )

                  ),
                  Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.grey.shade300,
                      child:
                      Row(
                        children: [
                          Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .85,
                              child:
                              TextField(

                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  hintText: 'Type your message here ...',

                                ),
                                onChanged: (text) {
                                  controller.thesendmessage = text;
                                },
                              )),
                          IconButton(onPressed: () {
                            onClicksendUser(context,
                                controller.thesendmessage, expertid, chatid,
                                expetname);
                          }, icon: Icon(Icons.send, color: firstBackColor,))
                        ],
                      )

                  )
                ],
              );
          })
      ),
    );
  }


  void onClicksendUser(context, String message, String expertid, String chatid,
      String expertname) async {
    ChatPageController c = ChatPageController();

    print(message);
    print(expertid);
    print(chatid);
    print(expertname);
    EasyLoading.show(status: 'loading..',);


    await controller.sendamessageUser(expertid, message);
    await c.GetThisChatMessage(chatid);


    if (controller.sendStatus) {
      if (c.messageofchatStatus) {
        print(c.messageofchatListcont);


        EasyLoading.showSuccess(
            'success', duration: Duration(milliseconds: 10),
            dismissOnTap: true);

        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>
                ChatPageStateUserview(c.messageofchatListcont, expertname, expertid, chatid)));
      }
    }

    else {
      EasyLoading.showError(
          'error', duration: Duration(milliseconds: 10), dismissOnTap: true);
    }
  }

  void onClickChatUserV(context, String chatid, String expetname,String expertid) async {

    EasyLoading.show(status: 'loading..',
    );
    await controller.GetThisChatMessage(chatid); // prog cant do anything under till this fun ends
    if(controller.messageofchatStatus) {
      EasyLoading.showSuccess(
          'success', duration: Duration(milliseconds: 500), dismissOnTap: true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatPageStateUserview(controller.messageofchatListcont, expetname, expertid, chatid)));
    }else{
      EasyLoading.showError(
          'error', duration: Duration(milliseconds: 500), dismissOnTap: true);
    }

  }
}