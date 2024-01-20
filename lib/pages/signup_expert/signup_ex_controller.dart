import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:digital_consulting_platform/pages/signup_expert/signup_ex_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/expert.dart';

class signupEXController extends GetxController {

  var name='';
  var email='';
  var password ='';
  var phonenumber='';
  var address='';
  var experinces='';
 // var M='';
 // var V ='';
 // var F='';
 // var P='';
 // var B ='';
 //  var sundayS1 ='';
 //  var mondayS1 ='';
 //  var tuesdayS1 ='';
 //  var wednesdayS1 ='';
 //  var thursdayS1 ='';
 //  var sundayE1 ='';
 //  var mondayE1='';
 //  var tuesdayE1 ='';
 //  var wednesdayE1 ='';
 //  var thursdayE1 ='';
  var cost_f ='';
  var cost_m ='';
  var cost_v ='';
  var cost_p ='';
  var cost_b ='';
 // var time_of_consultaion_v ='';
 // var time_of_consultaion_m ='';
 // var time_of_consultaion_f ='';
//  var time_of_consultaion_p ='';
 // var time_of_consultaion_b ='';



  var checkBoxM ;
  var checkBoxV ;
  var checkBoxF ;
  var checkBoxP ;
  var checkBoxB ;

  var durationM =60.obs ;
  var durationV =60.obs ;
  var durationF =60.obs;
  var durationP =60.obs;
  var durationB =60.obs;

  var sundayS=TimeOfDay.now().obs ;
  var mondayS =TimeOfDay.now().obs ;
  var tuesdayS=TimeOfDay.now().obs ;
  var wednesdayS =TimeOfDay.now().obs ;
  var thursdayS =TimeOfDay.now().obs ;
  var sundayE =TimeOfDay.now().obs ;
  var mondayE =TimeOfDay.now().obs ;
  var tuesdayE =TimeOfDay.now().obs ;
  var wednesdayE =TimeOfDay.now().obs ;
  var thursdayE =TimeOfDay.now().obs ;

  var message ;
  bool signupExpertStatus = false ;
 var selectEdxperiences = ''.obs ;
  var isprofilpicset = false.obs;
  var profilePicPath = "".obs;

  void setProfileImagePath (String path){
    profilePicPath.value = path ;
    isprofilpicset.value = true;
  }

 //SignupServiceEX service = SignupServiceEX();


  // Future<void> signupEXOnClick( ) async{
  //   Expert expert =Expert(name : name , email:email , password: password , passwordConfirm : passwordConfirm,address: address,experinces: experinces,details: details,starttime: starttime,endtime: endtime,imgpath:profilePicPath.value as File,duration: duration, cost: cost);
  //   signupExpertStatus = await service.signupEx(expert); // returns t or f
  //   message = service.message;
  //
  //   // if the back sends me a msg as a list so i can make it a string
  //   if (message is List ){
  //     String fix ='';
  //     for(String m in message) {
  //       fix +=m+ '\n';
  //     }
  //     message = fix;
  //
  //   }
  //   if(password != passwordConfirm){
  //     message = 'make sure of your password';
  //     signupExpertStatus = false;
  //   }
  // }
  List<String> options =['Medical','Vocational','Psychological','Family','Business/Management'];
   Rx<List<String>> SelectedOptionsList =Rx<List<String>>([]);



  @override
  void onInit() {
    checkBoxM =false.obs;
    checkBoxV =false.obs;
    checkBoxF =false.obs;
    checkBoxP =false.obs;
    checkBoxB =false.obs;



    super.onInit();
  }
  void changeCheckBoxM () {
    checkBoxM(!checkBoxM.value);
    print(checkBoxM);

  }
  void changeCheckBoxV () {
    checkBoxV(!checkBoxV.value);
    print(checkBoxV);

  }
  void changeCheckBoxF () {
    checkBoxF(!checkBoxF.value);
    print(checkBoxF);

  }
  void changeCheckBoxP () {
    checkBoxP(!checkBoxP.value);
    print(checkBoxP);

  }
  void changeCheckBoxB () {
    checkBoxB(!checkBoxB.value);
    print(checkBoxB);

  }
  void t () {

    print(durationM.value.toString());

  }

  choosesundayS () async{
    TimeOfDay ? pickedsundayS = await showTimePicker(
        context: Get.context!,
        initialTime: sundayS.value,
      helpText: 'time to start on sunday',
    );
    if(pickedsundayS !=null && pickedsundayS!= sundayS.value){
      sundayS.value = pickedsundayS ;
    }
    print('${sundayS.value.hour}:${sundayS.value.minute}:00');
  }

  choosemondayS () async{
    TimeOfDay ? pickedmondayS = await showTimePicker(
      context: Get.context!,
      initialTime: mondayS.value,
      helpText: 'time to start on monday',
    );
    if(pickedmondayS !=null && pickedmondayS!= mondayS.value){
      mondayS.value = pickedmondayS ;
    }
  }

  choosetuesdayS () async{
    TimeOfDay ? pickedtuesdayS = await showTimePicker(
      context: Get.context!,
      initialTime: tuesdayS.value,
      helpText: 'time to start on tuesday',
    );
    if(pickedtuesdayS !=null && pickedtuesdayS!= tuesdayS.value){
      tuesdayS.value = pickedtuesdayS ;
    }
  }

  choosewednesdayS () async{
    TimeOfDay ? pickedwednesdayS = await showTimePicker(
      context: Get.context!,
      initialTime: wednesdayS.value,
      helpText: 'time to start on wednesday',
    );
    if(pickedwednesdayS !=null && pickedwednesdayS!= wednesdayS.value){
      wednesdayS.value = pickedwednesdayS ;
    }
  }

  choosethursdayS () async{
    TimeOfDay ? pickedthursdayS= await showTimePicker(
      context: Get.context!,
      initialTime: thursdayS.value,
      helpText: 'time to start on wednesday',
    );
    if(pickedthursdayS !=null && pickedthursdayS!= thursdayS.value){
      thursdayS.value = pickedthursdayS ;
    }
  }

  choosesundayE () async{
    TimeOfDay ? pickedsundayE = await showTimePicker(
      context: Get.context!,
      initialTime: sundayE.value,
      helpText: 'time to end on sunday',
    );
    if(pickedsundayE !=null && pickedsundayE!= sundayE.value){
      sundayE.value = pickedsundayE ;
    }
  }

  choosemondayE () async{
    TimeOfDay ? pickedmondayE = await showTimePicker(
      context: Get.context!,
      initialTime: mondayE.value,
      helpText: 'time to end on monday',
    );
    if(pickedmondayE !=null && pickedmondayE!= mondayE.value){
      mondayE.value = pickedmondayE ;
    }
  }

  choosetuesdayE () async{
    TimeOfDay ? pickedtuesdayE = await showTimePicker(
      context: Get.context!,
      initialTime: tuesdayE.value,
      helpText: 'time to end on tuesday',
    );
    if(pickedtuesdayE !=null && pickedtuesdayE!= tuesdayE.value){
      tuesdayE.value = pickedtuesdayE ;
    }
  }

  choosewednesdayE () async{
    TimeOfDay ? pickedwednesdayE = await showTimePicker(
      context: Get.context!,
      initialTime: wednesdayE.value,
      helpText: 'time to end on wednesday',
    );
    if(pickedwednesdayE !=null && pickedwednesdayE!= wednesdayE.value){
      wednesdayE.value = pickedwednesdayE ;
    }
  }

  choosethursdayE () async{
    TimeOfDay ? pickedthursdayE= await showTimePicker(
      context: Get.context!,
      initialTime: thursdayE.value,
      helpText: 'time to end on wednesday',
    );
    if(pickedthursdayE !=null && pickedthursdayE!= thursdayE.value){
      thursdayE.value = pickedthursdayE ;
    }
  }

}