

import 'dart:async';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/pages/chat_page/chating_controller.dart';
import 'package:digital_consulting_platform/pages/chat_page/custom_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class Chats extends StatelessWidget{

  //ChatPageController controller = Get.find();
  ChatPageController controller = Get.put(ChatPageController() );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: firstBackColor,
        appBar: AppBar(
          title: Text("My Chats".tr,
            style:  TextStyle(
              fontSize: 25,
              // fontWeight: FontWeight.bold,
              fontFamily: "Raleway bold",
            ),
          ),
          backgroundColor: firstBackColor,
          toolbarHeight: 100,
          centerTitle: true,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),

        ),


        body:
        SafeArea(child:
        SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: gradientBackground,
                child: Column(
                    children:<Widget> [
                      //Appbar(),
                      Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          //   decoration: gradientBackground,
                          child: Obx (() {
                            if (controller.loading3.isTrue) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:
                                UserInformation.user_type =="expert"
                               ? controller.chatList.length
                                : controller.chatListUserView.length,

                                itemBuilder: (context, i) {

                                  return
                                    Card(
                                      color: secondBackColor,
                                        elevation: 5.2,
                                        shadowColor: firstBackColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30)),
                                        child : GestureDetector (
                                          onTap: (){
                                            UserInformation.user_type =="expert"

                                           ? onClickChat(context,controller.chatList[i].id.toString(),controller.chatList[i].user.name, controller.chatList[i].user.id.toString())
                                           :onClickChatUserV(context, controller.chatListUserView[i].id.toString(), controller.chatListUserView[i].expert.name, controller.chatListUserView[i].expert.id.toString());
                                          },
                                          child: Container(
                                            height: 65,
                                            width: MediaQuery.of(context).size.width,
                                            margin: const EdgeInsets.only(top: 10, bottom: 4),
                                            //  padding:
                                            //const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                                            child:
                                            Stack (
                                              children: [
                                                Row(

                                                    children: [
                                                      //picture

                                                      Container(
                                                        height: 60,
                                                        width: MediaQuery.of(context).size.width*0.25,
                                                        // color: Colors.amber,
                                                        child:
                                                        UserInformation.user_type =="expert"

                                                            ? CircleAvatar(
                                                          backgroundImage:

                                                          AssetImage('assets/images/profile2.jpg') ,//
                                                        )
                                                            :
                                                        CircleAvatar(
                                                            backgroundImage:
                                                            NetworkImage(
                                                                '${ServerConfig.domainNameserver}/${controller.chatListUserView[i].expert.imgpath}'
                                                            )),
                                                      ) ,

                                                      Text(
                                                          UserInformation.user_type =="expert"
                                                              ?controller.chatList[i].user.name
                                                              : controller.chatListUserView[i].expert.name
                                                          ,
                                                          style: TextStyle(
                                                            color: Colors.black ,
                                                            fontSize: 16,
                                                            fontFamily: 'Raleway bold',
                                                          )
                                                      ),

                                                      //   Expanded( child : Text(
                                                      //       controller.expertsList[i].experinces,
                                                      //       // : controller.findExperts.value[i].experinces,
                                                      //       style: TextStyle(
                                                      //         color: Colors.black ,
                                                      //         fontSize: 15,
                                                      //         fontFamily: 'Raleway reg',
                                                      //       )))
                                                      // ]) ),

                                                     ]),
                                                Positioned(child:
                                                Icon(
                                                  Icons.arrow_forward_rounded,
                                                  size: 20,
                                                  color: Colors.black,

                                                ),
                                                  right: 20,
                                                  top : 10,
                                                  bottom: 10,
                                                )
                                              ],
                                            )









                                          ),

                                    )

                                  );
                                }
                            );
                          }  )
                      )



                    ]))


        )
        ));
  }
  void onClickChat(context, String chatid, String username,String userid) async {

    EasyLoading.show(status: 'loading..',
    );
    await controller.GetThisChatMessage(chatid); // prog cant do anything under till this fun ends
if(controller.messageofchatStatus) {
  EasyLoading.showSuccess(
      'success', duration: Duration(milliseconds: 500), dismissOnTap: true);
  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPageState(controller.messageofchatListcont,username,userid,chatid)));

}else{
  EasyLoading.showError(
      'error', duration: Duration(milliseconds: 500), dismissOnTap: true);
}

  }

  void onClickChatUserV(context, String chatid, String expetname,String expertid) async {

    EasyLoading.show(status: 'loading..',
    );
    await controller.GetThisChatMessage(chatid); // prog cant do anything under till this fun ends
    if(controller.messageofchatStatus) {
      EasyLoading.showSuccess(
          'success', duration: Duration(milliseconds: 500), dismissOnTap: true);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPageStateUserview(controller.messageofchatListcont, expetname, expertid, chatid)));
    }else{
      EasyLoading.showError(
          'error', duration: Duration(milliseconds: 500), dismissOnTap: true);
    }

  }

}