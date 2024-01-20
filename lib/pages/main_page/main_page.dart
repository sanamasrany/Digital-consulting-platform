import 'dart:collection';

import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/costumtings/Costumbutton.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfield.dart';
import 'package:digital_consulting_platform/models/Fav_list.dart';
import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/pages/about_app/about_our_app.dart';
import 'package:digital_consulting_platform/pages/agora_page/audio_call.dart';
import 'package:digital_consulting_platform/pages/chat_page/chating_page.dart';
import 'package:digital_consulting_platform/pages/expert_main_pages/expert_main_reserved_times.dart';
import 'package:digital_consulting_platform/pages/expert_page/expert_page_controller.dart';

import 'package:digital_consulting_platform/pages/expert_page/expertpage.dart';
import 'package:digital_consulting_platform/pages/favorite_page/favorite_page.dart';
import 'package:digital_consulting_platform/pages/main_page/business.dart';
import 'package:digital_consulting_platform/pages/main_page/family.dart';
import 'package:digital_consulting_platform/pages/main_page/main_page_controller.dart';
import 'package:digital_consulting_platform/pages/main_page/main_page_service.dart';
import 'package:digital_consulting_platform/pages/main_page/medical.dart';
import 'package:digital_consulting_platform/pages/main_page/professional.dart';
import 'package:digital_consulting_platform/pages/main_page/psychologi.dart';

import 'package:digital_consulting_platform/pages/main_page/toprated.dart';
import 'package:digital_consulting_platform/provider/favorite_provider.dart';
import 'package:digital_consulting_platform/translation/trclass.dart';
import 'package:digital_consulting_platform/user_profile/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
// ignore_for_file: unused_import, unnecessary_import, sized_box_for_whitespace


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/expertmainpage.dart';

class MainPage extends StatelessWidget {

  MainPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
        children:<Widget> [
          Appbar(),
           Body(),
          Lista(),


        ]
      ),
          ) ),

    );
  }
}

class Body extends StatelessWidget {
  MainPageController controller = Get.find();
 // const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 4, left: 18),
              child:  Text("Our Services".tr,
                  style: TextStyle(
                    color: firstBackColor,
                    fontFamily: "Raleway bold",
                    //fontWeight: FontWeight.bold,
                    fontSize: 25,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(248, 0, 0, 0),
                          blurRadius: 2.0,
                          offset: Offset(2.3, 1))
                    ],
                  )),
            ),
          ],
        ),
        Container(
          height: 100,
          child: ListView(

            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(2),
            children: [
              // UserInformation.user_type == "expert"
              //     ?  GestureDetector(
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (context)=>ReservedPage() ) ,);
              //     },
              //     child:
              //     ClipRRect(
              //
              //         child: Stack (
              //           children: [
              //             Image.asset('assets/images/download.png',
              //                 height: 80, width: 100, fit: BoxFit.cover),
              //             Positioned(
              //                 bottom: 0,
              //                 child:
              //                 Container(
              //                   width: 100,
              //                   height: 20,
              //                   color:  secondBackColor,
              //                   padding: EdgeInsets.only(left: 6),
              //
              //
              //
              //
              //                   child :   Text(
              //                       'My Appointments'.tr,
              //                       style: TextStyle(
              //                         fontSize: 10,
              //                         fontFamily: 'Raleway bold',
              //                         color: Colors.white,
              //
              //                       )
              //                   ),
              //
              //                 ))
              //
              //
              //           ],
              //         )
              //
              //     ))
              //     :SizedBox(width: 0,),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Top10Page()) ,);
                  },
                  child:
                  ClipRRect(

                      child: Stack (
                        children: [
                          Image.asset('assets/images/istockphoto-1283466244-612x612.jpg',
                              height: 80, width: 100, fit: BoxFit.cover),
                          Positioned(
                              bottom: 0,
                              child:
                              Container(
                                width: 100,
                                height: 20,
                                color:  secondBackColor,
                                padding: EdgeInsets.only(left: 6),




                                child :   Text(
                                    'Top Rated'.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Raleway bold',
                                      color: Colors.white,

                                    )
                                ),

                              ))


                        ],
                      )

                  )),

              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                    //controller.medicallist();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MedicalPage()) ,);

                  },
                  child:
                  ClipRRect(

                      child: Stack (
                        children: [
                          Image.asset('assets/images/m.jpeg',
                              height: 80, width: 100, fit: BoxFit.cover),
                          Positioned(
                              bottom: 0,
                              child:
                              Container(
                                width: 100,
                                height: 20,
                                color:  secondBackColor,
                                padding: EdgeInsets.only(left: 6),




                                child :   Text(
                                    'Medical '.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Raleway bold',
                                      color: Colors.white,

                                    )
                                ),

                              ))


                        ],
                      )

                  )),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                //  controller.vocationallist();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VocationalPage()) ,);
                  },
                  child:
                  ClipRRect(

                      child: Stack (
                        children: [
                          Image.asset('assets/images/pr.jpeg',
                              height: 80, width: 100, fit: BoxFit.cover),
                          Positioned(
                              bottom: 0,
                              child:
                              Container(
                                width: 100,
                                height: 20,
                                color:  secondBackColor,
                                padding: EdgeInsets.only(left: 6),




                                child :   Text(
                                    'Vocational '.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Raleway bold',
                                      color: Colors.white,

                                    )
                                ),

                              ))


                        ],
                      )

                  )),
              // GestureDetector(
              //     onTap: (){
              //       //  controller.vocationallist();
              //       Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoritePage()) ,);
              //     },
              //     child:
              //     ClipRRect(
              //
              //         child: Stack (
              //           children: [
              //             Image.asset('assets/images/pr.jpeg',
              //                 height: 80, width: 100, fit: BoxFit.cover),
              //             Positioned(
              //                 bottom: 0,
              //                 child:
              //                 Container(
              //                   width: 100,
              //                   height: 20,
              //                   color:  secondBackColor,
              //                   padding: EdgeInsets.only(left: 6),
              //
              //
              //
              //
              //                   child :   Text(
              //                       'FB '.tr,
              //                       style: TextStyle(
              //                         fontSize: 14,
              //                         fontFamily: 'Raleway bold',
              //                         color: Colors.white,
              //
              //                       )
              //                   ),
              //
              //                 ))
              //
              //
              //           ],
              //         )
              //
              //     )),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                 //   controller.psychologicallist();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PsychologicalPage()) ,);
                  },
                  child:
                  ClipRRect(

                      child: Stack (
                        children: [
                          Image.asset('assets/images/ph.jpeg',
                              height: 80, width: 100, fit: BoxFit.cover),
                          Positioned(
                              bottom: 0,
                              child:
                              Container(
                                width: 100,
                                height: 20,
                                color:  secondBackColor,
                                padding: EdgeInsets.only(left: 6),




                                child :   Text(
                                    'Psychological '.tr ,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Raleway bold',
                                      color: Colors.white,

                                    )
                                ),

                              ))


                        ],
                      )

                  )),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                   // controller.familylist();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FamilyPage()) ,);
                  },
                  child:
                  ClipRRect(

                      child: Stack (
                        children: [
                          Image.asset('assets/images/f.jpeg',
                              height: 80, width: 100, fit: BoxFit.cover),
                          Positioned(
                              bottom: 0,
                              child:
                              Container(
                                width: 100,
                                height: 20,
                                color:  secondBackColor,
                                padding: EdgeInsets.only(left: 6),




                                child :   Text(
                                    'Family '.tr ,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Raleway bold',
                                      color: Colors.white,

                                    )
                                ),

                              ))


                        ],
                      )

                  )),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BusinessPage()) ,);
                  },
                  child:
                  ClipRRect(

                      child: Stack (
                        children: [
                          Image.asset('assets/images/b.jpeg',
                              height: 80, width: 100, fit: BoxFit.cover),
                          Positioned(
                              bottom: 0,
                              child:
                              Container(
                                width: 100,
                                height: 20,
                                color:  secondBackColor,
                                padding: EdgeInsets.only(left: 6),




                                child :   Text(
                                    'Business  '.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Raleway bold',
                                      color: Colors.white,

                                    )
                                ),

                              ))


                        ],
                      )

                  )),
            ],


          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 0, left: 18),
              child: Text("Our Experts".tr,
                  style: TextStyle(
                    color: firstBackColor,
                    fontFamily: "Raleway bold",
                   // fontWeight: FontWeight.bold,
                    fontSize: 25,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(248, 0, 0, 0),
                          blurRadius: 2.0,
                          offset: Offset(2.3, 1))
                    ],
                  )),
            ),
            SizedBox(width:90 ,),
            FloatingActionButton(onPressed: (){
              Get.toNamed('/reserveduser');
            }
              ,backgroundColor: firstBackColor,
              child: Icon (Icons.access_time),
            ),

           //  SizedBox(width:5 ,),
           //  FloatingActionButton(onPressed: ()async {
           //    final Uri url = Uri(
           //        scheme: 'tel',
           //        path: "0955304230"
           //    );
           //    if (await canLaunchUrl(url)) {
           //      await launchUrl(url);
           //    }
           //    else {
           //      print("cant launch");
           //    }
           //  }
           //    ,backgroundColor: firstBackColor,
           //    child: Icon (Icons.call),
           // ),
          ],
        )
      ],
    );
  }
}



class Appbar extends StatelessWidget {
  MainPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(top: 1, left: 20, right: 10),
      height: 230,
      width: double.infinity,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [
              firstBackColor,
              secondBackColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Column(

        children: [
      Expanded( child: SizedBox(height:3,)),

    Expanded( child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Text(
                "Find Your\nConsultation".tr,
                style: const TextStyle(
                  fontSize: 25,
                 // fontWeight: FontWeight.bold,
                  fontFamily: "Raleway bold",
                ),
                //Theme.of(context).textTheme.titleLarge,
              ),
               SizedBox(width:50),
              Expanded(child:
              Column(
                children: [
                  h(),

                  UserInformation.user_status =='true'
                  ? custumbutton(width: 150, hight: 25, buttonname: 'My expert page', fontsize: 13,buttencolor: firstBackColor,onTap:(){ Get.offAllNamed('/Expertmain');})
                      :SizedBox(height: 0,)
                ],
              )
              )   ,
             ],
          )),
          const SizedBox(
            height: 10
          ),
      Expanded(child: SearchTextField())     ,
        ],
      ),
    );
  }
}

class Lista extends StatelessWidget {


  MainPageController controller = Get.find();
 // ExpertPageController co = ExpertPageController();

bool showratebuttom = false  ;
var newrate ;
  @override
  Widget build(BuildContext context) {

    //double width = MediaQuery.of(context).size.width;
   // double height =MediaQuery.of(context).size.height;
    return

      Container (
        width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height *0.39 ,
        child: Obx ((){
          if(controller.loading.isTrue){
            return Center(
            child: CircularProgressIndicator(),
            );


    } return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: controller.search.isTrue
        ? controller.expertsList.length
        :controller.SearchList.value.length,
        //: controller.findExperts.value.length,

    itemBuilder: (context, i) {
    Expert ex = controller.expertsList[i];
    return
    Card(
    elevation: 5.2,
    shadowColor: firstBackColor,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30)),
    child : GestureDetector (
    onTap: (){

onClickanExpert(controller.expertsList[i].id.toString(),context,i);




    },
    child: Container(
    height: 65,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(top: 10, bottom: 4),
  //  padding:
    //const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
    child: Row(

    children: [ Expanded( child :
    //picture

    Container(
      height: 60,
      width: MediaQuery.of(context).size.width*0.25,
    // color: Colors.amber,
    child:

    controller.expertsList[i].imgpath !=null
   ? CircleAvatar(
    backgroundImage:

    NetworkImage(
        controller.search.isTrue
      ?  '${ServerConfig.domainNameserver}/${controller.expertsList[i].imgpath}'
            :'${ServerConfig.domainNameserver}/${controller.SearchList.value[i].imgpath}'

    ) ,//
    )

    : CircleAvatar(
      backgroundImage:

      AssetImage('assets/images/profile2.jpg') ,//
    ) ,
    ) ),
   Expanded(child:  Column(

    children:  [
   Expanded( child : Text( controller.search.isTrue
      ? controller.expertsList[i].name
       : controller.SearchList.value[i].name
      // : controller.findExperts.value[i].name
       ,
    style: TextStyle(
    color: Colors.black ,
    fontSize: 16,
    fontFamily: 'Raleway bold',
    )
    )),

        Expanded( child : Text(controller.search.isTrue
            ? controller.expertsList[i].experinces
            : controller.SearchList.value[i].experinces,
           // : controller.findExperts.value[i].experinces,
    style: TextStyle(
    color: Colors.black ,
    fontSize: 13,
    fontFamily: 'Raleway reg',
    )))
    ]) ),
   Expanded(child: SizedBox(width: 130,)),
       Expanded(child:   Icon(
    Icons.arrow_forward_rounded,
    size: 20,
    color: Colors.black,
    ),



       )

    ]),








    ),
    )
    );
    },

    );
    }

    ));
  }
  void onClickanExpert(String id,context,int i) async {

    EasyLoading.show(status: 'loading..',
    );
    await controller.controllerChickrate(id); // prog cant do anything under till this fun ends
    await controller.controllerChickfav(id);
    if (controller.ChickrateStatus ) {// has true or false depends on api
      if(controller.ChickFAVStatus){
      EasyLoading.showSuccess('success',duration: Duration(milliseconds: 100 ) , dismissOnTap: true );
     // showratebuttom = false ;
   // newrate = controller.newrate;
      controller.search.isTrue
          ?Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpertPage(controller.expertsList[i],false,controller.expertsList[i].valueOfRating.toDouble(),true)) ,)
          :Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpertPage(controller.SearchList.value[i],false,controller.expertsList[i].valueOfRating.toDouble(),true)) ,);
}else {
        EasyLoading.showSuccess('success',duration: Duration(milliseconds: 100 ) , dismissOnTap: true );
        // showratebuttom = false ;
        // newrate = controller.newrate;
        controller.search.isTrue
            ?Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpertPage(controller.expertsList[i],false,controller.expertsList[i].valueOfRating.toDouble(),false)) ,)
            :Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpertPage(controller.SearchList.value[i],false,controller.expertsList[i].valueOfRating.toDouble(),false)) ,);
      }
    }else{
      if(controller.ChickFAVStatus) {
        // showratebuttom = true ;
        EasyLoading.showSuccess(
            'success', duration: Duration(milliseconds: 100),
            dismissOnTap: true);
        controller.search.isTrue
            ? Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ExpertPage(controller.expertsList[i], true,
                controller.expertsList[i].valueOfRating.toDouble(),true)),)
            : Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ExpertPage(controller.SearchList.value[i], true,
                controller.expertsList[i].valueOfRating.toDouble(),true)),);
      }
    else{
        EasyLoading.showSuccess(
            'success', duration: Duration(milliseconds: 100),
            dismissOnTap: true);
        controller.search.isTrue
            ? Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ExpertPage(controller.expertsList[i], true,
                controller.expertsList[i].valueOfRating.toDouble(),false)),)
            : Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ExpertPage(controller.SearchList.value[i], true,
                controller.expertsList[i].valueOfRating.toDouble(),false)),);
      }
    }
  }


}


class SearchTextField extends StatelessWidget {
  MainPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return


    TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 26,
        ),
        suffixIcon: const Icon(
          Icons.mic,
          color: Color.fromARGB(255, 252, 254, 255),
          size: 26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search now".tr,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        isDense: true,
      ),
      onChanged: (value){
        controller.searchlist(value);
      },
    );
  }
}



class NavigationBarr extends StatelessWidget{
  MainPageController controller =Get.find();
  int currentIndex = 0;
  final screens = [
    MainPage(),
    Profile(),
    FavoritePage(),
    Chats(),
    AboutApp(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
body: Obx(()=>
    IndexedStack(
      index: controller.selectedIndex.value,
      children: screens,
    )
) ,

          bottomNavigationBar: Obx(()=> BottomNavigationBar(
            backgroundColor: firstBackColor,
            unselectedItemColor: const Color.fromARGB(255, 255, 249, 249),
            selectedItemColor: secondBackColor,
            iconSize: 24,
            // selectedFontSize: 38,
            //unselectedFontSize: 18,
            showSelectedLabels: true,
         type: BottomNavigationBarType.shifting,
           currentIndex: controller.selectedIndex.value,
           onTap: (index){
              controller.changeIndex(index);
           },
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:  'Home'.tr,
                backgroundColor: firstBackColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'.tr,
                backgroundColor: firstBackColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites'.tr,
                backgroundColor: firstBackColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'Chats'.tr,
                backgroundColor: firstBackColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.touch_app_rounded),
                label: 'About'.tr,
                backgroundColor: firstBackColor,
              ),
            ],
          )

          ) );
}



//
// Obx( (){
// if(controller.loading.isTrue){
// return Center(
// child: CircularProgressIndicator(
// color: firstBackColor,
// strokeWidth: 5,
// ),
// );
// }
// return   ListView.builder(
//
// itemCount: expertlist.length ,
// itemBuilder:  (context,index){
// Expert ex = expertlist[index];
// return
//
// Card(
// child: ListTile (
//
// title: Text(ex.name ?? 'expert'),
// leading: Image.asset(ex.imageurl ?? 'expert'),
// trailing: Icon(Icons.arrow_forward_rounded),
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpertPage(ex)) ,);
// },
// ),
// );
// }
//
// );
//
//
// }
//
// )
class services {
  var imgurl ;
  var service;
  services(
  {
    this.service,
    this.imgurl,
}
      );
}
List<services> expertservices = [

  services(
    service: 'Medical '.tr,
      imgurl: 'assets/images/m.jpeg',


  )  ,
  services(
      service: 'Professional '.tr,
      imgurl: 'assets/images/pr.jpeg',

  ),
  services(
    service: 'Psychological '.tr,
    imgurl: 'assets/images/ph.jpeg',

  ),
  services(
    service: 'Family '.tr,
    imgurl: 'assets/images/f.jpeg',

  ),
  services(
    service: 'Business  '.tr,
    imgurl: 'assets/images/b.jpeg',

  ),


];