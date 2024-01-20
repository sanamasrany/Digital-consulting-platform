


import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/models/expert_profile_details.dart';
import 'package:digital_consulting_platform/pages/about_app/about_our_app.dart';
import 'package:digital_consulting_platform/pages/expert_main_pages/expert_main_controller.dart';
import 'package:digital_consulting_platform/pages/expert_main_pages/expert_profile_page.dart';
import 'package:digital_consulting_platform/translation/trclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';



import '../../constant.dart';




class ReservedPage  extends StatelessWidget{


ExpertMainPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: firstBackColor,
appBar: AppBar(
  title: Text("My\nAppointments".tr,
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
        drawer: NavigationDrawer(),

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
                if (controller.loading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.expertAppoList.length,

                    itemBuilder: (context, i) {

                      return
                        Card(
                            color: fourthBackColor,
                            elevation: 5.2,
                            shadowColor: firstBackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  height: 110,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: const EdgeInsets.only(top: 10, bottom: 4),
                                  //  padding:
                                  //const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                                  child: Row(

                                    children: [
                                      SizedBox(width: 20,),

                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 5,),
                                            Text(
                                                'Client name : ${controller.expertAppoList[i].user.name}'

                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                )
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                                'Client Phone : ${controller.expertAppoList[i].user.phonenumber}'
                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                )),
                                            SizedBox(height: 5,),
                                            Text(
                                                'Session Time: ${controller.expertAppoList[i].startOfTimeReserved}'
                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                )),
                                            SizedBox(height: 5,),
                                            controller.expertAppoList[i].numberOfDay ==1
                                                ?    Text(
                                                'Session Day: Sunday'
                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                ))
                                                : SizedBox(height: 0,),
                                            controller.expertAppoList[i].numberOfDay ==2
                                                ?  Text(
                                                'Session Day: Monday'
                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                ))
                                                : SizedBox(height: 0,),
                                            controller.expertAppoList[i].numberOfDay ==3
                                                ?  Text(
                                                'Session Day: Tuesday'
                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                ))
                                                : SizedBox(height: 0,),
                                            controller.expertAppoList[i].numberOfDay ==4
                                                ?   Text(
                                                'Session Day: Wednesday'
                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                ))
                                                : SizedBox(height: 0,),
                                            controller.expertAppoList[i].numberOfDay ==5
                                                ?    Text(
                                                'Session Day: Friday'
                                                ,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Raleway bold',
                                                ))
                                                : SizedBox(height: 0,),

                                          ]),
                                      SizedBox(width: 70,),
                                      Icon(
                                        Icons.access_time_filled_sharp,
                                        size: 20,
                                        color: firstBackColor,
                                      ),

                                    ],


                                  ),
                                )
                            ));
                    }
                );
              }  )
          )



    ]))


    )
    ));

  }

}

class NavigationDrawer extends StatelessWidget{
  ExpertMainPageController controller = Get.put(ExpertMainPageController());
  @override
  Widget build(BuildContext context) {
   return Drawer(
     backgroundColor: secondBackColor,
     child: SingleChildScrollView(
       child: Column(

         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           buildHeader(context),
           buildMenuItems(context),
         ],
       ),
     ),
   );

  }
Widget buildHeader(BuildContext context)=> Container(
  height: MediaQuery.of(context).size.height*.40,
  color: firstBackColor,
  padding:  EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
    bottom: MediaQuery.of(context).padding.bottom,
  ),
  child:
  GestureDetector(
      onTap: (){
        Expert ex = controller.expertdetails;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ExpertPerProfile(ex: ex,) ));
      },
    child:  Column(
    children: [
      controller.expertdetails.imgpath!='null'
          ? CircleAvatar(
        radius: 52,
        backgroundImage:

        NetworkImage('${ServerConfig.domainNameserver}/${controller.expertdetails.imgpath}') ,//
      )

          : CircleAvatar(
        radius: 52,
        backgroundImage:

        AssetImage('assets/images/profile2.jpg') ,//
      ) ,
      SizedBox(height: 12,),
      Text(
        controller.expertdetails.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'Raleway bold',
        ),
      ),
      SizedBox(height: 12,),
      Text(
        controller.expertdetails.email,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Raleway reg',
        ),
      )
    ],
  )),


);

  Widget buildMenuItems (BuildContext context)=>
      Container(
        padding: EdgeInsets.all(24),
      child:   Wrap(
        runSpacing: 16,
        children: [
          ListTile(
leading: Icon(Icons.home_outlined),
            title: Text("My Appointments".tr),
            onTap: (){
  Get.offAllNamed('/Expertmain');
            },
          ),


          ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text("Chats".tr),
            onTap: (){
              Get.toNamed('/chat');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("logout".tr),
            onTap: (){
              onClicklogout();
            },
          ),
          ListTile(
            leading: Icon(Icons.touch_app_outlined),
            title: Text("About".tr),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutApp()) ,);
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("language :".tr),

          ),
Text('                          '),
SizedBox(height: 30,),
          h(),


        ],
      ))
    ;
  void onClicklogout() async {


    EasyLoading.show(status: 'loading..',
    );
    await controller.logoutOnClick(); // prog cant do anything under till this fun ends
    if (controller.logoutStatus) { // has true or false depends on api
      EasyLoading.showSuccess(controller.message ,duration: Duration(seconds: 1 ) , dismissOnTap: true );
      Get.offNamed('/login'); //so it dont returns to signup again
    }else{
      EasyLoading.showError(controller.message , duration: Duration(seconds: 1 ) , dismissOnTap: true );
      print('error');

    }
  }
}
