//signup EXpert view
import 'dart:convert';
import 'dart:io';

import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfieldpassword.dart';
import 'package:digital_consulting_platform/native_service/secure_storage.dart';
import 'package:digital_consulting_platform/pages/signup_expert/hero_dialoge_route.dart';

import 'package:digital_consulting_platform/pages/signup_expert/signup_ex_controller.dart';
import 'package:digital_consulting_platform/translation/trclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:digital_consulting_platform/costumtings/Costumbutton.dart';
import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:http/http.dart' as http;
import 'package:numberpicker/numberpicker.dart';

import '../../config/server_config.dart';
String _businesspopcard ='business_popcard';
String _M ='midical_popcard';
String _p ='p_popcard';
String _v ='vocational_popcard';
String _f ='family_popcard';


class SignUpEX extends StatelessWidget {


  var token;

  String userID='' ;

  var type;

  signupEXController controller = Get.find(); //find me the controller
  //var url = Uri.parse(ServerConfig.domainNameserver + ServerConfig.signupexpert);
  var url = Uri.parse('${ServerConfig.domainNameserver}/api/registerexpert');
  Future signupex (String name , String email , String password ,String experinces ,String phonenumber , String address ,
      String M ,String V ,String F , String P , String B,
      String sundayS ,String mondayS ,String tuesdayS ,String wednesdayS ,String thursdayS ,
      String sundayE ,String mondayE,String tuesdayE ,String wednesdayE ,String thursdayE ,
      String cost_f ,String cost_m ,String cost_v ,String cost_p ,String cost_b ,
      String time_of_consultaion_m ,String time_of_consultaion_v ,String time_of_consultaion_f ,String time_of_consultaion_p ,String time_of_consultaion_b ,
      File image )async{
    var request = http.MultipartRequest('POST',url);
    request.fields.addAll({
      'name':name ,
      'email': email,
      'password': password,
      'experinces':experinces ,
      'M':M ,
      'V':V ,
      'F': F,
      'P':P ,
      'B':B ,
      'phonenumber': phonenumber,
      'address': address,
      'sundayS':sundayS ,
      'mondayS':mondayS ,
      'tuesdayS':tuesdayS ,
      'wednesdayS': wednesdayS,
      'thursdayS':thursdayS ,
      'sundayE': sundayE,
      'mondayE':mondayE ,
      'tuesdayE': tuesdayE,
      'wednesdayE': wednesdayE,
      'thursdayE': thursdayE,
      'cost_f': cost_f,
      'cost_m':cost_m ,
      'cost_v':cost_v ,
      'cost_p': cost_p,
      'cost_b': cost_b,
      'time_of_consultaion_m': time_of_consultaion_m,
      'time_of_consultaion_v':time_of_consultaion_v ,
      'time_of_consultaion_f': time_of_consultaion_f,
      'time_of_consultaion_p':time_of_consultaion_p ,
      'time_of_consultaion_b':time_of_consultaion_b ,


    });

    request.files.add(await http.MultipartFile.fromPath('imgpath', image.path));

    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 201) {
     // print(await response.stream.bytesToString());

      Map<String,dynamic> msg = jsonDecode(await response.stream.bytesToString());

      token = msg['token'];
      userID = msg['id'].toString();
      type = "expert";

      UserInformation.user_type = type;
      UserInformation.user_password = password;


        UserInformation.expert_id = userID;
        UserInformation.expert_token = token;
        print(UserInformation.expert_token);
        print(UserInformation.expert_id);


      print(UserInformation.user_type);
      print( UserInformation.user_password);


        //save token to device
        SecureStorage storage = SecureStorage();

          await storage.save('experttoken', UserInformation.expert_token);
          await storage.save('expertID', UserInformation.expert_id);


        await storage.save('userPassword', UserInformation.user_password);




      Get.offNamed('/Expertmain');
    }
    else {
      print(response.reasonPhrase);
    }
  }
  File? pickedFile ;
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:

        Container(

            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: gradientBackground,

            child: ListView(

              children: [
                h(),

                Center(
                    child:
                    Stack(
                      children: <Widget>[
                        Obx(() =>  CircleAvatar(
                            radius: 80.0,
                            backgroundImage: controller.isprofilpicset.value == true
                                ?FileImage(File(controller.profilePicPath.value)) as ImageProvider
                                :AssetImage('assets/images/profile2.jpg')
                        ),) ,
                        Positioned(
                            bottom: 20.0,
                            right: 20.0,
                            child: InkWell(
                              onTap: () {
                                print("camera clicked");
                                showModalBottomSheet(context : context,
                                    builder: (context)=>bottomSheet(context));

                              },
                              child: Icon(Icons.camera_alt,
                                color: firstBackColor,
                                size: 28.0,
                              ),
                            ))
                      ],
                    )
                ),


                // Image.asset('assets/images/logo3.png' , fit: BoxFit.contain
                //   ,height: 300 , width: 300,),
                SizedBox(height: 5,),
                Center(
                  child: Text(
                    'Sign up as an Expert :'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Raleway bold',


                    ),

                  ),),

                SizedBox(height: 30,),
                Column(
                    children: [
                      CostumTextField(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'User Name'.tr,
                        onchange: (value) {
                          controller.name = value;
                        },
                      ),

                      SizedBox(height: 10,),
                      CostumTextField(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'Email'.tr,
                        onchange: (value) {
                          controller.email = value;
                        },
                      ),
                      SizedBox(height: 10,),
                      CostumTextFieldPassword(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'Password'.tr,
                        onchange: (value) {
                          controller.password = value;
                        },
                      ),

                      SizedBox(height: 10,),
                      CostumTextField(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'details'.tr,
                        onchange: (value) {
                          controller.experinces = value;
                        },
                      ),
                      SizedBox(height: 10,),
                      CostumTextField(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'Contact informations (Phone number)'.tr,
                        keyboard: TextInputType.phone,
                        onchange: (value) {
                          controller.phonenumber = value;
                        },
                      ),
                      SizedBox(height: 10,),
                      CostumTextField(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'Contact informations (Address)'.tr,
                        onchange: (value) {
                          controller.address = value;
                        },
                      ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Available time a day start '.tr,
                      //   keyboard: TextInputType.phone,
                      //   onchange: (value) {
                      //    controller.starttime = value ;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Available time a day end  '.tr,
                      //   keyboard: TextInputType.phone,
                      //   onchange: (value) {
                      //         controller.endtime = value  ;
                      //   },
                      // ),
                      SizedBox(height: 10,),
                      Center(
                        child: Text(
                          'Choose your type of consultation :'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway bold',


                          ),

                        ),),
                      Center(

                          child : Row (
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text(
                                  'Medical '.tr,
                                  style: TextStyle(
                                    color: Colors.white ,
                                    fontSize: 18,
                                    fontFamily: 'Raleway reg',
                                  ),

                                       ),
                          Hero(tag: _M, child:
                                Obx(() {
                                  return
                                    Checkbox(value: controller.checkBoxM.value ,
                                      onChanged: (bool? value) {
                                        controller.changeCheckBoxM();

                                        Navigator.of(context).push(HeroDialogRoute(
                                          builder : (context){
                                            return _MedicalPopCard();
                                          },
                                        )
                                        );
                                      },

                                    );

                                })),
                                SizedBox(width: 20,)
                              ] )),
                      Center(
                          child : Row (
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                'Vocational '.tr,
                                style: TextStyle(
                                  color: Colors.white ,
                                  fontSize: 18,
                                  fontFamily: 'Raleway reg',
                                ),

                              ),
                          Hero(tag: _v, child:
                                Obx(() {
                                  return Checkbox(value: controller.checkBoxV.value ,
                                    onChanged: (bool? value) {
                                      controller.changeCheckBoxV();

                                      Navigator.of(context).push(HeroDialogRoute(
                                        builder : (context){
                                          return _VocationalPopCard();
                                        },
                                      )
                                      );
                                    },
                                  );

                                })),

                                SizedBox(width: 20,)
                              ] )),
                      Center(
                          child : Row (
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Family '.tr,
                                  style: TextStyle(
                                    color: Colors.white ,
                                    fontSize: 18,
                                    fontFamily: 'Raleway reg',
                                  ),

                                ),
                          Hero(tag: _f, child:
                                Obx(() {
                                  return Checkbox(value: controller.checkBoxF.value ,
                                    onChanged: (bool? value) {
                                      controller.changeCheckBoxF();

                                      Navigator.of(context).push(HeroDialogRoute(
                                        builder : (context){
                                          return _FamilyPopCard();
                                        },
                                      )
                                      );
                                    },
                                  );

                                })),

                                SizedBox(width: 20,)
                              ] )),
                      Center(
                          child : Row (
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                'Psychological '.tr,
                                style: TextStyle(
                                  color: Colors.white ,
                                  fontSize: 18,
                                  fontFamily: 'Raleway reg',
                                ),

                              ),
                          Hero(tag: _p, child:
                                Obx(() {
                                  return Checkbox(value: controller.checkBoxP.value ,
                                    onChanged: (bool? value) {
                                      controller.changeCheckBoxP();

                                      Navigator.of(context).push(HeroDialogRoute(
                                        builder : (context){
                                          return _PsychologicalPopCard();
                                        },
                                      )
                                      );
                                    },
                                  );

                                })),

                                SizedBox(width: 20,)
                              ] )),
                      Center(
                          child : Row (
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                'Business  '.tr,
                                style: TextStyle(
                                  color: Colors.white ,
                                  fontSize: 18,
                                  fontFamily: 'Raleway reg',
                                ),

                              ),
                                Hero(tag: _businesspopcard, child:
                                Obx(() {
                                  return Checkbox(value: controller.checkBoxB.value ,
                                    onChanged: (bool? value) {
                                      controller.changeCheckBoxB();
                                      
                                      Navigator.of(context).push(HeroDialogRoute(
                                        builder : (context){
                                          return _BusinessPopCard();
                                        },
                                      )
                                         );
                                      
                                    },
                                  );

                                })),

                                SizedBox(width: 20,)
                              ] )),

                      SizedBox(height: 10,),
                      Center(
                        child: Text(
                          'Choose your available time during the week :'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway bold',


                          ),

                        ),),


                      SizedBox(height: 10,),
                      Column(

                        children: [
                      Row(
                        children: [
                          SizedBox(width: 10,),  Column(
                      children: [  Text(
                          'Sunday start in'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway bold',


                          ),

                        ),
                      Obx(() => Text(
                        "${controller.sundayS.value.hour}:${controller.sundayS.value.minute}",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Raleway bold',


                      ),
                      ) ),
                        ElevatedButton(onPressed: (){controller.choosesundayS();}, child: Text ('select time'.tr),
                        style:  ElevatedButton.styleFrom(
                          backgroundColor: firstBackColor,
                        )
                        ),
                      ])
                              ,SizedBox(width: 70,),
                          Column(
                              children: [
                          Text(
                            'Sunday end in'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Raleway bold',


                            ),

                          ),
                                Obx(() => Text(
                                  "${controller.sundayE.value.hour}:${controller.sundayE.value.minute}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Raleway bold',


                                  ),
                                ) ),
                                ElevatedButton(onPressed: (){controller.choosesundayE();}, child: Text ('select time'.tr),
                                    style:  ElevatedButton.styleFrom(
                                      backgroundColor: firstBackColor,
                                    )
                                ),

                              ]),
                        ]
                      ),
                        Row(
                            children: [
                            SizedBox(width: 10,),  Column(
                                  children: [  Text(
                                    'Monday start in'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Raleway bold',


                                    ),

                                  ),
                                    Obx(() => Text(
                                      "${controller.mondayS.value.hour}:${controller.mondayS.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosemondayS();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),
                                  ])
                              ,SizedBox(width: 70,),
                              Column(
                                  children: [
                                    Text(
                                      'Monday end in'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Raleway bold',


                                      ),

                                    ),
                                    Obx(() => Text(
                                      "${controller.mondayE.value.hour}:${controller.mondayE.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosemondayE();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),

                                  ]),
                            ]
                        ),
                        Row(
                            children: [
                            SizedBox(width: 10,),   Column(
                                  children: [  Text(
                                    'Tuesday start in'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Raleway bold',


                                    ),

                                  ),
                                    Obx(() => Text(
                                      "${controller.tuesdayS.value.hour}:${controller.tuesdayS.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosetuesdayS();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),
                                  ])
                              ,SizedBox(width: 60,),
                              Column(
                                  children: [
                                    Text(
                                      'Tuesday end in'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Raleway bold',


                                      ),

                                    ),
                                    Obx(() => Text(
                                      "${controller.tuesdayE.value.hour}:${controller.tuesdayE.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosetuesdayE();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),

                                  ]),
                            ]
                        ),
                        Row(
                            children: [
                                Column(
                                  children: [  Text(
                                    'Wednesday start in'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Raleway bold',


                                    ),

                                  ),
                                    Obx(() => Text(
                                      "${controller.wednesdayS.value.hour}:${controller.wednesdayS.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosewednesdayS();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),
                                  ])
                              ,SizedBox(width: 20,),
                              Column(
                                  children: [
                                    Text(
                                      'Wednesday end in'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Raleway bold',


                                      ),

                                    ),
                                    Obx(() => Text(
                                      "${controller.wednesdayE.value.hour}:${controller.wednesdayE.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosewednesdayE();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),

                                  ]),
                            ]
                        ),
                        Row(
                            children: [
                            SizedBox(width: 10,),       Column(
                                  children: [  Text(
                                    'Thursday start in'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Raleway bold',


                                    ),

                                  ),
                                    Obx(() => Text(
                                      "${controller.thursdayS.value.hour}:${controller.thursdayS.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosethursdayS();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),
                                  ])
                              ,SizedBox(width: 50,),
                              Column(
                                  children: [
                                    Text(
                                      'Thursday end in'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Raleway bold',


                                      ),

                                    ),
                                    Obx(() => Text(
                                      "${controller.thursdayE.value.hour}:${controller.thursdayE.value.minute}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Raleway bold',


                                      ),
                                    ) ),
                                    ElevatedButton(onPressed: (){controller.choosethursdayE();}, child: Text ('select time'.tr),
                                        style:  ElevatedButton.styleFrom(
                                          backgroundColor: firstBackColor,
                                        )
                                    ),

                                  ]),
                            ]
                        ),

                          ],
                        ),


                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to start on Sunday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.sundayS1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to start on Monday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.mondayS1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext:'Time to start on Tuesday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.tuesdayS1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to start on Wednesday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.wednesdayS1 = value;
                      //   },
                      // ), SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to start on Thursday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.thursdayS1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // Center(
                      //   child: Text(
                      //     'Your shift ends in :'.tr,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway bold',
                      //
                      //
                      //     ),
                      //
                      //   ),),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to end on Sunday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.sundayE1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to end on Monday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.mondayE1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to end on Tuesday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.tuesdayE1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to end on Wednesday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.wednesdayE1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Time to end on Thursday , ex:07:00:00'.tr,
                      //
                      //   onchange: (value) {
                      //     controller.thursdayE1 = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // Center(
                      //   child: Text(
                      //     'Duration of your session in minutes : '.tr,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway bold',
                      //
                      //
                      //     ),
                      //
                      //   ),),
                      // SizedBox(height: 10,),

                    // Center(
                    //   child: Text(
                    //     'Duration of session as medical '.tr,
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 20,
                    //       fontFamily: 'Raleway bold',
                    //
                    //
                    //     ),
                    //
                    //   ),),
                    // Obx(() =>
                    //     NumberPicker(minValue: 1,
                    //       maxValue: 120,
                    //       value: controller.durationM.value,
                    //       onChanged: (value) {
                    //         controller.durationM.value = value;
                    //       },
                    //       selectedTextStyle: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20,
                    //         fontFamily: 'Raleway bold',
                    //       ),
                    //       axis: Axis.horizontal,
                    //     )),

                      // SizedBox(height: 10,),
                      // Center(
                      //   child: Text(
                      //     'Duration of session as vocational '.tr,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway bold',
                      //
                      //
                      //     ),
                      //
                      //   ),),
                      // Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationV.value,
                      //   onChanged: (value){
                      //     controller.durationV.value = value;
                      //   },
                      //   selectedTextStyle: TextStyle (
                      //     color: Colors.white,
                      //     fontSize: 20,
                      //     fontFamily: 'Raleway bold',
                      //   ),
                      //   axis: Axis.horizontal,
                      // )),
                      // SizedBox(height: 10,),
                      // Center(
                      //   child: Text(
                      //     'Duration of session as family '.tr,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway bold',
                      //
                      //
                      //     ),
                      //
                      //   ),),
                      // Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationF.value,
                      //   onChanged: (value){
                      //     controller.durationF.value = value;
                      //   },
                      //   selectedTextStyle: TextStyle (
                      //     color: Colors.white,
                      //     fontSize: 20,
                      //     fontFamily: 'Raleway bold',
                      //   ),
                      //   axis: Axis.horizontal,
                      // )),
                    //  SizedBox(height: 10,),
                      // Center(
                      //   child: Text(
                      //     'Duration of session as psychological '.tr,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway bold',
                      //
                      //
                      //     ),
                      //
                      //   ),),
                      // Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationP.value,
                      //   onChanged: (value){
                      //     controller.durationP.value = value;
                      //   },
                      //   selectedTextStyle: TextStyle (
                      //     color: Colors.white,
                      //     fontSize: 20,
                      //     fontFamily: 'Raleway bold',
                      //   ),
                      //   axis: Axis.horizontal,
                      // )),
                     // SizedBox(height: 10,),
                      // Center(
                      //   child: Text(
                      //     'Duration of session as business '.tr,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway bold',
                      //
                      //
                      //     ),
                      //
                      //   ),),
                      // Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationB.value,
                      //   onChanged: (value){
                      //     controller.durationB.value = value;
                      //   },
                      //   selectedTextStyle: TextStyle (
                      //     color: Colors.white,
                      //     fontSize: 20,
                      //     fontFamily: 'Raleway bold',
                      //   ),
                      //   axis: Axis.horizontal,
                      // )),


                      // SizedBox(height: 10,),
                      // Center(
                      //   child: Text(
                      //     'Cost of your session :'.tr,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway bold',
                      //
                      //
                      //     ),
                      //
                      //   ),),
                      // SizedBox(height: 10,),
                      //
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Cost of session as family ,ex: 2000'.tr,
                      //   keyboard: TextInputType.phone,
                      //   onchange: (value) {
                      //     controller.cost_f = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Cost of session as medical ,ex: 2000'.tr,
                      //   keyboard: TextInputType.phone,
                      //   onchange: (value) {
                      //     controller.cost_m = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Cost of session as vocational ,ex: 2000'.tr,
                      //   keyboard: TextInputType.phone,
                      //   onchange: (value) {
                      //     controller.cost_v = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Cost of session as psychological ,ex: 2000'.tr,
                      //   keyboard: TextInputType.phone,
                      //   onchange: (value) {
                      //     controller.cost_p = value;
                      //   },
                      // ),
                      // SizedBox(height: 10,),
                      // CostumTextField(
                      //   height: 60,
                      //   width: MediaQuery
                      //       .of(context)
                      //       .size
                      //       .width * 0.9,
                      //   hinttext: 'Cost of session as business ,ex: 2000'.tr,
                      //   keyboard: TextInputType.phone,
                      //   onchange: (value) {
                      //     controller.cost_b = value;
                      //   },
                      // ),


                      // SizedBox(height: 10,),
                      // Container(
                      //     height: 60,
                      //     width: MediaQuery
                      //         .of(context)
                      //         .size
                      //         .width * 0.9,
                      //     decoration: BoxDecoration(
                      //         color: secondBackColor.withAlpha(60),
                      //         border: Border(
                      //           top: BorderSide(
                      //               width: 4, color: white.withAlpha(50)),
                      //           left: BorderSide(
                      //               width: 4, color: white.withAlpha(50)),
                      //           right: BorderSide(
                      //               width: 4, color: white.withAlpha(50)),
                      //           bottom: BorderSide(
                      //               width: 4, color: white.withAlpha(50)),
                      //         )
                      //     ),
                      //     child:
                      //     Obx(() =>
                      //         DropDownMultiSelect(options: controller.options,
                      //
                      //           hint: Text('Classification of experiences'.tr,
                      //
                      //             style: TextStyle(
                      //
                      //               color: Colors.white,
                      //               fontSize: 16,
                      //               fontFamily: 'Raleway reg',
                      //             ),
                      //
                      //           ),
                      //           hintStyle: TextStyle(
                      //
                      //             color: Colors.black,
                      //             fontSize: 16,
                      //             fontFamily: 'Raleway bold',
                      //           ),
                      //           decoration: InputDecoration(
                      //             hintText: '', contentPadding: EdgeInsets
                      //               .fromLTRB(30, 8, 8, 8),
                      //             enabledBorder: InputBorder.none,
                      //           ),
                      //
                      //
                      //           onChanged: (value) {
                      //             controller.SelectedOptionsList.value = value;
                      //             controller.selectEdxperiences.value = '';
                      //             controller.SelectedOptionsList.value.forEach((
                      //                 element) {
                      //               controller.selectEdxperiences.value =
                      //                   controller.selectEdxperiences.value +
                      //                       " " + element;
                      //             });
                      //           },
                      //           selectedValues: controller.SelectedOptionsList.value,
                      //
                      //
                      //         ))
                      //
                      // ),
                      SizedBox(height: 20,),


                      custumbutton(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .9,
                        hight: 70,
                        fontsize: 20,
                        buttonname: 'Sign Up'.tr,
                        onTap: () {
                       signupex(controller.name , controller.email , controller.password ,controller.experinces ,controller.phonenumber , controller.address ,
                           controller.checkBoxM.toString() ,controller.checkBoxV.toString() ,controller.checkBoxF.toString() , controller.checkBoxP.toString() , controller.checkBoxB.toString(),
                           '${controller.sundayS.value.hour}:${controller.sundayS.value.minute}:00' ,'${controller.mondayS.value.hour}:${controller.mondayS.value.minute}:00' ,'${controller.tuesdayS.value.hour}:${controller.tuesdayS.value.minute}:00' ,'${controller.wednesdayS.value.hour}:${controller.wednesdayS.value.minute}:00' ,'${controller.thursdayS.value.hour}:${controller.thursdayS.value.minute}:00' ,
                           '${controller.sundayE.value.hour}:${controller.sundayE.value.minute}:00' ,'${controller.mondayE.value.hour}:${controller.mondayE.value.minute}:00','${controller.tuesdayE.value.hour}:${controller.tuesdayE.value.minute}:00' ,'${controller.wednesdayE.value.hour}:${controller.wednesdayE.value.minute}:00','${controller.thursdayE.value.hour}:${controller.thursdayE.value.minute}:00' ,
                           controller.cost_f ,controller.cost_m ,controller.cost_v ,controller.cost_p ,controller.cost_b ,
                           controller.durationM.value.toString() ,controller.durationV.value.toString() ,controller.durationF.value.toString(),controller.durationP.value.toString() ,controller.durationB.value.toString(), pickedFile!);

                        },
//controller.sundayS.value.toString() ,controller.mondayS.value.toString() ,controller.tuesdayS.value.toString() ,controller.wednesdayS.value.toString() ,controller.thursdayS.value.toString() ,
//                            controller.sundayE.value.toString() ,controller.mondayE.value.toString(),controller.tuesdayE.value.toString() ,controller.wednesdayE.value.toString() ,controller.thursdayE.value.toString() ,
                      ),
                      SizedBox(height: 20,),


                      Row(

                          children: [
                            SizedBox(width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.15,),
                            Text(
                              'Already have an account ?'.tr,
                              style: TextStyle(
                                color: firstBackColor,
                                fontSize: 18,
                                fontFamily: 'Raleway reg',
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                ' login!'.tr,
                                style: TextStyle(
                                  color: firstBackColor,
                                  fontSize: 18,
                                  fontFamily: 'Raleway reg',
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {
                                Get.offNamed('/login');
                              },
                            ),
                          ]),
                      SizedBox(height: 20,),
                    ]),
              ],
            )


        ),

      ),
    );
  }

  // void onClickSignup() async {
  //   EasyLoading.instance
  //     ..displayDuration = const Duration(milliseconds: 2000)
  //     ..indicatorType = EasyLoadingIndicatorType.wave
  //     ..loadingStyle = EasyLoadingStyle.dark
  //     ..indicatorSize = 45.0
  //     ..radius = 10.0
  //     ..progressColor = Colors.yellow
  //     ..backgroundColor = Colors.green
  //     ..indicatorColor = Colors.yellow
  //     ..textColor = Colors.yellow
  //     ..maskColor = Colors.blue.withOpacity(0.5)
  //     ..userInteractions = true
  //     ..dismissOnTap = false;
  //
  //   EasyLoading.show(status: 'loading..',
  //   );
  //   await controller.signupEXOnClick(); // prog cant do anything under till this fun ends
  //   if (controller.signupExpertStatus) { // has true or false depends on api
  //     EasyLoading.showSuccess(
  //         controller.message, duration: Duration(seconds: 10),
  //         dismissOnTap: true);
  //     Get.offNamed('/login'); //so it dont returns to signup again
  //   } else {
  //     EasyLoading.showError(controller.message, duration: Duration(seconds: 10),
  //         dismissOnTap: true);
  //     print('error');
  //  }
 // }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.15,
      width: double.infinity,
      margin:const EdgeInsets.symmetric(
          horizontal: 20, vertical: 20
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Raleway reg",

            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(onPressed: () {
                print('camera');
                takephoto(ImageSource.camera);
              },
                icon: Icon(Icons.camera),
                label: Text("Camera"),

              ),
              SizedBox(width: 10,),
              TextButton.icon(onPressed: () {
                print('gallery');
                takephoto(ImageSource.gallery);
              }, icon: Icon(Icons.image),
                label: Text("Gallery"),

              ),

            ],

          )
        ],
      ),
    );

  }
  void takephoto (ImageSource source)async {
    final pickedImage = await imagePicker.pickImage(
        source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    print(pickedFile);
    controller.setProfileImagePath(pickedFile!.path);
  }
}


class _BusinessPopCard extends StatelessWidget {
  signupEXController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _businesspopcard ,

          child: Material(
            color: secondBackColor,
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
                        'Duration of session as business '.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationB.value,
                      onChanged: (value){
                        controller.durationB.value = value;
                      },
                      selectedTextStyle: TextStyle (
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway bold',
                      ),
                      axis: Axis.horizontal,
                    )),
                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: 'session Cost ,ex: 2000'.tr,

                      keyboard: TextInputType.number,
                      onchange: (value) {
                        controller.cost_b = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
class _FamilyPopCard extends StatelessWidget {
  signupEXController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _f ,

          child: Material(
            color: secondBackColor,
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
                        'Duration of session as family '.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationF.value,
                      onChanged: (value){
                        controller.durationF.value = value;
                      },
                      selectedTextStyle: TextStyle (
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway bold',
                      ),
                      axis: Axis.horizontal,
                    )),
                    SizedBox(height: 10,),


                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: 'session Cost ,ex: 2000'.tr,
                      keyboard: TextInputType.phone,
                      onchange: (value) {
                        controller.cost_f = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
class _VocationalPopCard extends StatelessWidget {
  signupEXController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _v ,

          child: Material(
            color: secondBackColor,
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
                        'Duration of session as vocational '.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationV.value,
                      onChanged: (value){
                        controller.durationV.value = value;
                      },
                      selectedTextStyle: TextStyle (
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway bold',
                      ),
                      axis: Axis.horizontal,
                    )),
                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: 'session Cost ,ex: 2000'.tr,
                      keyboard: TextInputType.phone,
                      onchange: (value) {
                        controller.cost_v = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
class _MedicalPopCard extends StatelessWidget {
  signupEXController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _M,

          child: Material(
            color: secondBackColor,
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
                        'Duration of session as medical '.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    Obx(() =>
                        NumberPicker(minValue: 1,
                          maxValue: 120,
                          value: controller.durationM.value,
                          onChanged: (value) {
                            controller.durationM.value = value;


                          },
                          selectedTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway bold',
                          ),
                          axis: Axis.horizontal,
                        )),
                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: 'session Cost ,ex: 2000'.tr,
                      keyboard: TextInputType.phone,
                      onchange: (value) {
                        controller.cost_m = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _PsychologicalPopCard extends StatelessWidget {
  signupEXController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _p ,

          child: Material(
            color: secondBackColor,
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
                        'Duration of session as psychological '.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),
                    Obx(() =>    NumberPicker(minValue: 1, maxValue: 120, value: controller.durationP.value,
                      onChanged: (value){
                        controller.durationP.value = value;
                      },
                      selectedTextStyle: TextStyle (
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway bold',
                      ),
                      axis: Axis.horizontal,
                    )),
                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: 'session Cost ,ex: 2000'.tr,
                      keyboard: TextInputType.phone,
                      onchange: (value) {
                        controller.cost_p = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}