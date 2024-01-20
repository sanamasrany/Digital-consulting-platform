import 'dart:convert';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/costumtings/Costumbutton.dart';
import 'package:digital_consulting_platform/models/day_model.dart';
import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/pages/agora_page/audio_call.dart';
import 'package:digital_consulting_platform/pages/chat_page/chating_controller.dart';
import 'package:digital_consulting_platform/pages/chat_page/custom_chat_page.dart';

import 'package:digital_consulting_platform/pages/expert_page/expert_page_controller.dart';

import 'package:digital_consulting_platform/pages/main_page/main_page_controller.dart';
import 'package:digital_consulting_platform/pages/signup_expert/hero_dialoge_route.dart';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';



import '../../models/expertmainpage.dart';

String _C ='Choose';
String _S ='select';
String _R ='rate';

class ExpertPage extends StatelessWidget{

 final controller = Get.put(ExpertPageController());
 DaylistPageController c = DaylistPageController();



    Expert expert;
    bool showratebuttom;
     double  valueOfRating;
 bool redheart;

 ExpertPage(this.expert,this.showratebuttom,this.valueOfRating,this.redheart);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height =MediaQuery.of(context).size.height;
//controller.experience(expert);



    return Scaffold (
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children:<Widget> [
              Container(
                height: height*0.55,
                decoration: BoxDecoration(
                  image:
                  expert.imgpath != null
                 ? DecorationImage(image:
                 NetworkImage( '${ServerConfig.domainNameserver}/${expert.imgpath}')
                   ,
                  fit: BoxFit.cover
                  )
              :DecorationImage(image:
                  AssetImage('assets/images/profile2.jpg')   ,
          fit: BoxFit.cover
      )
                ),
                child:  Container (
                  decoration: BoxDecoration (
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.9),
                        ], begin: Alignment.topLeft , end:  Alignment.bottomRight
                      )
                  ),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height*0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          firstBackColor,
                          secondBackColor,
                          thirdBackColor,
                          fourthBackColor

                        ]
                    ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) )

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Text(
                      expert.name ?? 'expert name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Raleway bold',
                      )
                    ),SizedBox(height: 5,),
       //     Row(
       //                children: [
       //
       //              Visibility(
       //                 visible: controller.med.value
       //                ,  child:
       //              Text(
       //                'Medical',
       //                  style: TextStyle(
       //                    color: Colors.white,
       //                    fontSize: 22,
       //                    fontFamily: 'Raleway bold',
       //                  )
       //              ))
       //                ,SizedBox(width: 2,),
       //                  Visibility(
       //                      visible: controller.bus.value
       //                      ,  child:
       //                  Text(
       //                      'Business',
       //                      style: TextStyle(
       //                        color: Colors.white,
       //                        fontSize: 22,
       //                        fontFamily: 'Raleway bold',
       //                      )
       //                  ))
       //                  ,SizedBox(width: 2,),
       //                  Visibility(
       //                      visible: controller.voc.value
       //                      ,  child:
       //                  Text(
       //                      'Vocational',
       //                      style: TextStyle(
       //                        color: Colors.white,
       //                        fontSize: 22,
       //                        fontFamily: 'Raleway bold',
       //                      )
       //                  ))
       //                  ,SizedBox(width: 2,),
       //                  Visibility(
       //                      visible: controller.fam.value
       //                      ,  child:
       //                  Text(
       //                      'Family',
       //                      style: TextStyle(
       //                        color: Colors.white,
       //                        fontSize: 22,
       //                        fontFamily: 'Raleway bold',
       //                      )
       //                  ))
       //                  ,SizedBox(width: 2,),
       //                  Visibility(
       //                      visible: controller.pys.value
       //                      ,  child:
       //                  Text(
       //                      'Psychological',
       //                      style: TextStyle(
       //                        color: Colors.white,
       //                        fontSize: 22,
       //                        fontFamily: 'Raleway bold',
       //                      )
       //                  ))
       //
       //                ],
       //
       //
       //
       // ),
                    Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        expert.consultation.mId != null
                        ?  Text(
                                         '- Medical'.tr,
                                           style: TextStyle(
                                             color: Colors.white,
                                             fontSize: 22,
                                             fontFamily: 'Raleway bold',
                                           )
                                       )
                         : Text(''
                          , style: TextStyle(height: 0),
                        ),
                        expert.consultation.vId != null
                        ?  Text(
                            '- Vocational'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Raleway bold',)
                        )
                        :  Text(''
                          , style: TextStyle(height: 0),
                        ),
                        expert.consultation.pId!= null
                        ? Text(
                           '- Psychological'.tr,
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 22,
                             fontFamily: 'Raleway bold',
                           )
                       )
                       :  Text(''
                          , style: TextStyle(height: 0),
                        ),
                        expert.consultation.fId != null
                        ?  Text(
                                 '- Family'.tr,
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 22,
                                   fontFamily: 'Raleway bold',
                                 )
                             )
                            :  Text(''
                          , style: TextStyle(height: 0),
                        ),
                        expert.consultation.bId != null
                        ? Text(
                             '- Business'.tr,
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 22,
                               fontFamily: 'Raleway bold',
                             )
                         )
                            :  Text(''
                          , style: TextStyle(height: 0),
                        ),
                      ],
                    ),
                    SizedBox(height: 1,),
                         Container(
                          height: height*0.08,//50
                          width: width,
                          child:
                           // ListView.builder(
                      // itemCount: expert.valueOfRating.toInt() ?? 0
                      //     ,scrollDirection: Axis.horizontal
                      //     ,itemBuilder: (context,int key){
                      //   return Icon(Icons.star , color: Colors.yellow,size: 34,);
                   RatingBarIndicator(
                    rating: valueOfRating,
                    itemCount: 5,
                    itemSize: 34,
                    direction: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Icon(Icons.star, color: fourthBackColor,);
                    }


                ),     // }),





                    ),



                    SizedBox(height: 1,),
                    Text(
                      "About :".tr
                          ,style: TextStyle(
                      color: firstBackColor,
                      fontSize: 22,
                      fontFamily: 'Raleway bold',
                    ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      expert.experinces ?? " details here",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway reg',
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      "Address :".tr
                      ,style: TextStyle(
                      color: firstBackColor,
                      fontSize: 22,
                      fontFamily: 'Raleway bold',
                    ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      expert.address ?? " details here",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway reg',
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      "Phone Number :".tr
                      ,style: TextStyle(
                      color: firstBackColor,
                      fontSize: 22,
                      fontFamily: 'Raleway bold',
                    ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      expert.phonenumber ?? " details here",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway reg',
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      "Available time this week :".tr
                      ,style: TextStyle(
                      color: firstBackColor,
                      fontSize: 22,
                      fontFamily: 'Raleway bold',
                    ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                     "sunday : ${expert.time.sundayS} - ${expert.time.sundayE}\n"
                         "monday : ${expert.time.mondayS} - ${expert.time.mondayE}\n"
                         "tuesday : ${expert.time.tuesdayS} - ${expert.time.tuesdayE}\n"
                         "wednesday : ${expert.time.wednesdayS} - ${expert.time.wednesdayE}\n"
                         "thursday : ${expert.time.thursdayS} - ${expert.time.thursdayE}\n"?? " details here",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway reg',
                      ),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    // children: <Widget>[  Text(
                    //       "Session cost",
                    //       style: TextStyle(
                    //         color: firstBackColor,
                    //         fontSize: 16,
                    //         fontFamily: 'Raleway bold',
                    //       ),
                    //     ),
                    //    Text(
                    //       "5000",
                    //      style: TextStyle(
                    //        color: Colors.black,
                    //        fontSize: 20,
                    //        fontFamily: 'Raleway bold',
                    //      ),
                    //
                    //    )
                    //   ] ),

                        showratebuttom
                    ?    Hero(tag: _R, child:
                        custumbutton(width: MediaQuery.of(context).size.width*.30,
                            hight: 40,
                            buttonname: "Rate me".tr,

                            onTap: (){
                              Navigator.of(context).push(HeroDialogRoute(
                                builder : (context){
                                  return _SendRate(expert,redheart);
                                },
                              ));
                            }))
                            : SizedBox(width: MediaQuery.of(context).size.width*.30,)
                       , SizedBox(width: 4,),
                        custumbutton(width: MediaQuery.of(context).size.width*.30,
                            hight: 40,
                            buttonname: "Text me".tr,

                            onTap: (){
                              onClickChatUserV(context);
                            })

                      ],
                    )
                    ,
                    SizedBox(height: 10,),
                    Center(child:
                    Hero(tag: _C, child:
                    custumbutton(width:  MediaQuery.of(context).size.width*.50,
                        hight: 50,
                        buttonname: "Book a session".tr,

                        onTap: (){
                          Navigator.of(context).push(HeroDialogRoute(
                            builder : (context){
                              return _ChooseConsultion(expert);
                            },
                          ));
                        })),),

                  ],
                ),
              ),
              Positioned(
                  left: 30,
                  top: height * 0.05,
                  child: GestureDetector(
                    onTap: (){

                      Get.offAllNamed('/mainpage');
                    },
                    child: Icon(
                      Icons.keyboard_backspace,
                      size: 42,
                      color: Colors.white,
                    ),

                  )

              ),
              Positioned(
                  right: 30,
                  top: height * 0.05,
                  child: GestureDetector(
                    onTap: ()async{
                      final Uri url = Uri(
                          scheme: 'tel',
                          path: "${expert.phonenumber}"
                      );
                      if(await canLaunchUrl(url)){
                      await launchUrl(url);}
                      else{
                      print("cant launch");
                      }

                    },
                    child: Icon(
                      Icons.call,
                      size: 42,
                      color: Colors.black,
                    ),

                  )

              ),
              Positioned(
                  right: 30,
                  top: height*0.45,
                  child:
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ]
                    ),
                    child:
                    IconButton(onPressed: (){
                      onClickADDtoFav(context);

                      // provider.togglefav(expert);
                      // if (provider.isExist(expert) ){
                      //   Get.snackbar(" expert added successfully ", "you have added ${expert.name} to favorites "
                      //     , duration: Duration(seconds: 3),
                      //   );
                      // }else {
                      //   Get.snackbar(" expert remove successfully ", "you have removed ${expert.name} from favorites "
                      //     , duration: Duration(seconds: 3),
                      //   );
                      // }
                    },

                        icon: redheart
                            ?Icon(Icons.favorite, color: Colors.red,size: 45,)
                            :Icon(Icons.favorite_border,size: 45,)
                    ),
                  )

              )

            ],
          ),

        ),
      ),




    );

  }
 void onClickADDtoFav(context) async {
   MainPageController mc = MainPageController();
   EasyLoading.show(status: 'loading..',
   );
   await mc.controllerChickrate(expert.id.toString());
   await controller.AddToFav(expert.id.toString()); // prog cant do anything under till this fun ends
   if (controller.addfavStatus) { // has true or false depends on api
     if (mc.ChickrateStatus) {
       EasyLoading.showSuccess('success', duration: Duration(milliseconds: 100),
           dismissOnTap: true);
       // showratebuttom = false ;
       // newrate = controller.newrate;
       Navigator.push(context, MaterialPageRoute(builder: (context) =>
           ExpertPage(expert, false, expert.valueOfRating.toDouble(), true)),);
     } else {
       EasyLoading.showSuccess('success', duration: Duration(milliseconds: 100),
           dismissOnTap: true);

       Navigator.push(context, MaterialPageRoute(builder: (context) =>
           ExpertPage(expert, true, expert.valueOfRating.toDouble(), true)),);
     }
   } else {
     EasyLoading.showError('try again', duration: Duration(milliseconds: 500),
         dismissOnTap: true);
     print('error');
   }
 }
 void onClickChatUserV(context) async {
   ChatPageController c = Get.put(ChatPageController());
   EasyLoading.show(status: 'loading..',
   );
   await controller.makechat(expert.id.toString()); // prog cant do anything under till this fun ends


   if(controller.makechatStatus) {
     await c.GetThisChatMessage(controller.chatidcon.toString());

     if(c.messageofchatStatus) {
       EasyLoading.showSuccess(
           controller.message, duration: Duration(milliseconds: 500),
           dismissOnTap: true);


       Navigator.push(context, MaterialPageRoute(builder: (context) =>
           ChatPageStateUserview(c.messageofchatListcont, expert.name, expert.id.toString(),
               controller.chatidcon.toString())));
     }
   }else{
     EasyLoading.showError(
         'error', duration: Duration(milliseconds: 500), dismissOnTap: true);
   }

 }


 }



class _ChooseConsultion extends StatelessWidget {
  DaylistPageController controller = DaylistPageController();
  Expert expert ;
  _ChooseConsultion(this.expert);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _C ,

          child: Material(
            color: thirdBackColor,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Select the session day'.tr,
                        style: TextStyle(
                          color: firstBackColor,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    Obx(() =>
                        DropdownButton(items: [
                          DropdownMenuItem(child:
                          Text("Sunday".tr),
                            value: '1',
                          ),
                          DropdownMenuItem(child:
                          Text("Monday".tr),
                            value: '2',
                          ),
                          DropdownMenuItem(child:
                          Text("Tuesday".tr),
                             value: '3',
                          ),
                          DropdownMenuItem(child:
                          Text("Wednesday".tr),
                            value: '4',
                          ),
                          DropdownMenuItem(child:
                          Text("Thursday".tr),
                             value: '5',
                          ),
                        ],
                            value: controller.selectedday.value,
                            onChanged: (value){
                              controller.selectedday.value = value!;
                        })
                    ),

                    Center(
                      child: Text(
                        'Select your consultation'.tr,
                        style: TextStyle(
                          color: firstBackColor,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),

                    SizedBox(height: 10,),

          Obx(() =>          Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        expert.consultation.mId != null
                            ?
                       // Hero(tag: _S, child:
                       Column(children: [
                         custumbutton(width: MediaQuery.of(context).size.width*.30,
                             hight: 40,
                             buttonname: 'Medical'.tr,
                             buttencolor: controller.mcolor.value,

                             onTap: (){
                               controller.num.value = 3;
                               controller.mcolor.value = firstBackColor;
                               controller.fcolor.value = secondBackColor;
                               controller.vcolor.value = secondBackColor;
                               controller.bcolor.value = secondBackColor;
                               controller.pcolor.value = secondBackColor;

                             }),
                        SizedBox(height: 10,),

                       ],

                       )
          //)
                            : Text(''
                          , style: TextStyle(height: 0),
                        ),

                        expert.consultation.vId != null
                            ?
                      //  Hero(tag: _S, child:
                        Column(children: [
                          custumbutton(width: MediaQuery.of(context).size.width*.30,
                              hight: 40,
                              buttonname: 'Vocational'.tr,
                              buttencolor: controller.vcolor.value,
                              onTap: (){
                                controller.num.value = 5;
                                controller.vcolor.value = firstBackColor;
                                controller.fcolor.value = secondBackColor;
                                controller.mcolor.value = secondBackColor;
                                controller.bcolor.value = secondBackColor;
                                controller.pcolor.value = secondBackColor;

                              })
                          ,SizedBox(height: 10,)

                        ],)

                        //)

                            :  Text(''
                          , style: TextStyle(height: 0),
                        ),

                        expert.consultation.pId!= null
                            ?
                     //   Hero(tag: _S, child:
                        Column(children: [
                          custumbutton(width: MediaQuery.of(context).size.width*.35,
                              hight: 40,
                              buttonname: 'Psychological'.tr,
                              buttencolor: controller.pcolor.value,
                              onTap: (){
                                controller.num.value = 4;
                                controller.pcolor.value = firstBackColor;

                                controller.fcolor.value = secondBackColor;
                                controller.vcolor.value = secondBackColor;
                                controller.bcolor.value = secondBackColor;
                                controller.mcolor.value = secondBackColor;

                              }),
                          SizedBox(height: 10,)

                        ],)

        //)
                            :  Text(''
                          , style: TextStyle(height: 0),
                        ),
                        expert.consultation.fId != null
                            ?
                       // Hero(tag: _S, child:
                        Column(children: [
                          custumbutton(width: MediaQuery.of(context).size.width*.30,
                              hight: 40,
                              buttonname: 'Family'.tr,
                              buttencolor: controller.fcolor.value,
                              onTap: (){
                                controller.num.value = 2;
                                controller.fcolor.value = firstBackColor;

                                controller.mcolor.value = secondBackColor;
                                controller.vcolor.value = secondBackColor;
                                controller.bcolor.value = secondBackColor;
                                controller.pcolor.value = secondBackColor;

                              }),
                          SizedBox(height: 10,)
                        ],)

        //)
                            : Text(''
                          , style: TextStyle(height: 0),
                        ),
                        expert.consultation.bId != null
                            ?
                       // Hero(tag: _S, child:
                        Column(
                          children: [
                            custumbutton(width: MediaQuery.of(context).size.width*.30,
                                hight: 40,
                                buttonname: 'Business'.tr,
                                buttencolor: controller.bcolor.value,

                                onTap: (){
                                  controller.num.value = 1;
                                  controller.bcolor.value = firstBackColor;

                                  controller.fcolor.value = secondBackColor;
                                  controller.vcolor.value = secondBackColor;
                                  controller.mcolor.value = secondBackColor;
                                  controller.pcolor.value = secondBackColor;

                                }),
                            SizedBox(height: 10,)
                          ],
                        )

        //)
                            :  Text(''
                        , style: TextStyle(height: 0),
                        ),
                      ],
                    )),

                    SizedBox(height: 20,),
             Row(
             mainAxisAlignment: MainAxisAlignment.end
             ,
             children: [

               custumbutton(width: MediaQuery.of(context).size.width*.25,
                   hight: 30,
                   buttonname: 'submit'.tr,

                   onTap: (){
                     onClicksubmit(context);

                   }),

             ],),




                    SizedBox(height: 10,),




                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void onClicksubmit(context) async {

    EasyLoading.show(status: 'loading..',
    );
    await controller.Daytimelist(expert.id.toString()); // prog cant do anything under till this fun ends
    if (controller.listStatus) { // has true or false depends on api
      Day d = Day(day: controller.DAYlist , cost: controller.cost);
      print(d.cost);
      print(d.day);

      EasyLoading.showSuccess('success',duration: Duration(milliseconds: 500 ) , dismissOnTap: true );
      Navigator.of(context).push(HeroDialogRoute(
        builder : (context){
          return _Sessionlist(d,expert,controller.num.value.toString() , controller.selectedday.value.toString());
        },
      )) ;
    }else{
      EasyLoading.showError('error' , duration: Duration(milliseconds: 500 ) , dismissOnTap: true );
      print('error');

    }
  }

}

class _Sessionlist extends StatelessWidget {


  Day d;
  Expert expert ;
  String numm ;
  String selecteddayy;
  _Sessionlist(this.d,this.expert,this.numm,this.selecteddayy);

  DaylistPageController controller = DaylistPageController();
    // Expert expert ;
    // _Sessionlist(this.expert);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _S ,

          child: Material(
            color: thirdBackColor,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                       "session cost : ${d.cost.toString()}",
                        style: TextStyle(
                          color: firstBackColor,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        "Choose your session time :".tr,
                        style: TextStyle(
                          color: firstBackColor,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
    Container (
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height *0.39 ,
    child:
        // Obx (() {
    //   if (controller.loading.isTrue) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    //   return
          ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: d.day.length ,
          itemBuilder: (context, i) {

            List<String> ex = d.day[i];
            return
              Card(
                  elevation: 5.2,
                  color: thirdBackColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),

            child: Container(
            height: ex.length*33,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 5, bottom: 5),

            child:
                Center (child:
                    ListView.builder(
                        scrollDirection: Axis.vertical,

                        itemCount: ex.length-1
                        ,itemBuilder: (context, i) {
                      return
                        Card(

                            shadowColor: firstBackColor,
                          elevation: 5.2,

                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),

                      child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 10, bottom: 4),
                  child:
                  GestureDetector(
                    onTap: (){
    onClickatime(context, ex[i].toString(), ex[i+1].toString());
    controller.bookcolor.value=false;
                    },
                    child:
                      Center (child:
                          controller.bookcolor.value
                  ?    Text(
                        ex[i].toString(),
                        style: TextStyle(
                          color: firstBackColor,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      )
                    :    Text(
                            ex[i].toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontFamily: 'Raleway bold',


                            ),

                          )   ,

                      ),
                  )


                      )
                      );

                    }



                    )


            )  ,

            )
              );
          }
      )
   // })
    ),


                    SizedBox(height: 10,),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClickatime(context, String st , String en) async {

    EasyLoading.show(status: 'loading..',
    );
    await controller.bookasession(expert.id.toString(), st, en ,numm ,selecteddayy); // prog cant do anything under till this fun ends
    if (controller.bookingStatus) { // has true or false depends on api

      EasyLoading.showSuccess(controller.message,duration: Duration(milliseconds: 1000 ) , dismissOnTap: true );
      // Navigator.of(context).push(HeroDialogRoute(
      //   builder : (context){
      //     return _Sessionlist(d);
      //   },
      // )) ;
    }else{
      EasyLoading.showError('error' , duration: Duration(milliseconds: 500 ) , dismissOnTap: true );
      print('error');

    }
  }

}
class _SendRate extends StatelessWidget {
  // signupEXController controller = Get.find();
  Expert e;
  bool redheart;

  _SendRate(this.e,this.redheart);

  ExpertPageController c = ExpertPageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _R,

          child: Material(
            color: thirdBackColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Rate me of 5'.tr,
                        style: TextStyle(
                          color: firstBackColor,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    SizedBox(height: 10,),

                    RatingBar.builder(itemBuilder: (context, index) {
                      return Icon(Icons.star, color: firstBackColor,);
                    },
                        itemCount: 5,
                        initialRating: 0.5,
                        minRating: 0.5,
                        allowHalfRating: true,
                        direction: Axis.horizontal,
                        itemSize: 34,
                        onRatingUpdate: (value) {
                          print(value);
                          c.clientrate.value = value;
                        }),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end
                      ,
                      children: [

                        custumbutton(width: MediaQuery
                            .of(context)
                            .size
                            .width * .30,
                            hight: 30,
                            buttonname: 'submit Rate'.tr,

                            onTap: () {
                              onClickSubmitrate(e.id.toString(),context,redheart);
                            }),

                      ],),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClickSubmitrate(String id,context,bool redheart) async {

  MainPageController mc = MainPageController();
    EasyLoading.show(status: 'loading..',
    );
    await c.sendrate(id, c.clientrate.value.toString()); // prog cant do anything under till this fun ends
    if (c.sendrateStatus) { // has true or false depends on api
print("here${c.newrate}");
if (mc.ChickFAVStatus){
  EasyLoading.showSuccess('success',duration: Duration(milliseconds: 100 ) , dismissOnTap: true );
  // showratebuttom = false ;
  // newrate = controller.newrate;
  Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpertPage(e,false,c.newrate.toDouble(),true)) ,);

}else {
  EasyLoading.showSuccess('success',duration: Duration(milliseconds: 100 ) , dismissOnTap: true );

  Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpertPage(e,false,c.newrate.toDouble(),false)) ,);

}
    }else {
      EasyLoading.showError('try again', duration: Duration(milliseconds: 1000),
          dismissOnTap: true);
      print('error');
    }

// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ExpertPage(e,false,c.newrate.value.toDouble(),redheart)) ,);
//       EasyLoading.showSuccess(
//           'your rate has been sent', duration: Duration(milliseconds: 1000),
//           dismissOnTap: true);
//
//
//     } else {
//       EasyLoading.showError('try again', duration: Duration(milliseconds: 1000),
//           dismissOnTap: true);
//       print('error');
//     }
  }
}