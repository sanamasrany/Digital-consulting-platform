import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/pages/reserved_user_page/reserved_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservedUserView extends StatelessWidget{


  ReservedUserController controller = Get.find();
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
                                itemCount: controller.reserveduserlist.length,

                                itemBuilder: (context, i) {

                                  return
                                    Card(
                                        color: fourthBackColor,
                                        elevation: 5.2,
                                        shadowColor: firstBackColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30)),

                                            child: Container(
                                              height: 150,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              margin: const EdgeInsets.only(top: 10, bottom: 4),
                                              //  padding:
                                              //const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                                              child: Row(

                                                children: [

                                              Container(
                                                height: 60,
                                                width: MediaQuery.of(context).size.width*0.25,
                                                // color: Colors.amber,
                                                child:
                                                controller.reserveduserlist[i].expert.imgpath != null

                                                    ?  CircleAvatar(
                                                    backgroundImage:
                                                    NetworkImage(
                                                        'https://c2c4-31-9-136-203.eu.ngrok.io/${controller.reserveduserlist[i].expert.imgpath}'
                                                    ))
                                               : CircleAvatar(
                                                  backgroundImage:

                                                  AssetImage('assets/images/profile2.jpg') ,//
                                                )

                                              ) ,
                                                 Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 5,),
                                                        Text(
                                                            'Expert name : ${controller.reserveduserlist[i].expert.name}'

                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            )
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Text(
                                                            'Expert Experinces : ${controller.reserveduserlist[i].expert.experinces}'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            )),
                                                        SizedBox(height: 5,),
                                                        Text(
                                                            'Expert Address : ${controller.reserveduserlist[i].expert.address}'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            )),
                                                        SizedBox(height: 5,),

                                                        Text(
                                                            'Expert Phone : ${controller.reserveduserlist[i].expert.phonenumber}'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            )),
                                                        SizedBox(height: 5,),
                                                        Text(
                                                            'Session Time: ${controller.reserveduserlist[i].startOfTimeReserved}'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            )),
                                                        SizedBox(height: 5,),
                                                        controller.reserveduserlist[i].numberOfDay ==1
                                                            ?    Text(
                                                            'Session Day: Sunday'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            ))
                                                            : SizedBox(height: 0,),
                                                        controller.reserveduserlist[i].numberOfDay ==2
                                                            ?  Text(
                                                            'Session Day: Monday'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            ))
                                                            : SizedBox(height: 0,),
                                                        controller.reserveduserlist[i].numberOfDay ==3
                                                            ?  Text(
                                                            'Session Day: Tuesday'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            ))
                                                            : SizedBox(height: 0,),
                                                        controller.reserveduserlist[i].numberOfDay ==4
                                                            ?   Text(
                                                            'Session Day: Wednesday'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            ))
                                                            : SizedBox(height: 0,),
                                                        controller.reserveduserlist[i].numberOfDay ==5
                                                            ?    Text(
                                                            'Session Day: Friday'
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontFamily: 'Raleway bold',
                                                            ))
                                                            : SizedBox(height: 0,),

                                                      ]),


                                                ],


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

}