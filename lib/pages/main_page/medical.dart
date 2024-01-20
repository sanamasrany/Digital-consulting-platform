import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/models/expertmainpage.dart';
import 'package:digital_consulting_platform/models/medical_model.dart';
import 'package:digital_consulting_platform/pages/expert_page/expertpage.dart';
import 'package:digital_consulting_platform/pages/main_page/main_page_controller.dart';
import 'package:digital_consulting_platform/provider/favorite_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';



class MedicalPage  extends StatelessWidget{
 // const MedicalPage  ({Key? key}): super(key: key);
  MainPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Medical".tr),
          centerTitle: true,

          backgroundColor: secondBackColor,


        ),
        body:
        SafeArea(
          child: Container(
              decoration: gradientBackground,
        child: Obx (() {
          if (controller.loading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.expertsListmedical.length,

              itemBuilder: (context, i) {
                MedicalElement ex = controller.expertsListmedical[i];
                return
                  Card(
                      elevation: 5.2,
                      shadowColor: firstBackColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: GestureDetector(
                        onTap: () {
                         // Navigator.push(context, MaterialPageRoute(
                       //       builder: (context) => ExpertPage(ex)),);
                        },
                        child: Container(
                          height: 65,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: const EdgeInsets.only(top: 10, bottom: 4),
                          //  padding:
                          //const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                          child: Row(

                              children: [ Expanded(child:
                              //picture

                              Container(
                                height: 60,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.25,
                                // color: Colors.amber,
                                child:
                                controller.expertsListmedical[i].expert.imgpath !=null
                                    ? CircleAvatar(
                                  backgroundImage:

                                  NetworkImage('${ServerConfig.domainNameserver}/${controller.expertsListmedical[i].expert.imgpath}'


                                  ) ,//
                                )

                                    : CircleAvatar(
                                  backgroundImage:

                                  AssetImage('assets/images/profile2.jpg') ,//
                                ) ,

                              )),
                                Expanded(child: Column(

                                    children: [
                                      Expanded(child: Text(
                                          controller.expertsListmedical[i].expert.name

                                          ,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Raleway bold',
                                          )
                                      )),

                                      Expanded(child: Text(
                                          controller.expertsListmedical[i]
                                              .expert.experinces
                                          ,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Raleway reg',
                                          )))
                                    ])),
                                Expanded(child: SizedBox(width: 130,)),
                                Expanded(child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                )
                              ]),


                        ),
                      )
                  );
              }
          );
        }  )
    )
    )
    );

  }

}
