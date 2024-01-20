import 'package:digital_consulting_platform/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: Text("About Our App".tr),
          centerTitle: true,

          backgroundColor: secondBackColor,


        ),
        body:
        SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: gradientBackground,

               child:
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(
                         'Digital consulting platform'.tr
                             ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 25,
                         fontFamily: 'Raleway bold',
                       ),
                       ),
SizedBox(height: 30,),
                       Text(
                         'that gives any expert an opportunity'.tr
                         ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       Text(
                             ' to offer his/her consult '.tr
                         ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       Text(

                             ' and reach many people'.tr
                         ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       Text(
                         'and gives users many options '.tr
                         ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       Text(

                             'to choose the expert they prefer'.tr
                         ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       Text(

                             ' and easily communicate and'.tr
                         ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ), Text(

                         'book a session with him/her'.tr
                         ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       SizedBox(height: 50,),
                       Text(
                         'Developed by :'.tr
                         ,style: TextStyle(
                         color: firstBackColor,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),

                       Text(
                         'Frontend : Sana Masrany'.tr
                         ,style: TextStyle(
                         color: firstBackColor,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       Text(
                         'Backend : AbdAlrhman QarahBolad'.tr
                         ,style: TextStyle(
                         color: firstBackColor,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',
                       ),
                       ),
                       SizedBox(height: 30,),
                       Text(
                         'with Flutter and Laravel'.tr
                         ,style: TextStyle(
                         color: firstBackColor,
                         fontSize: 20,
                         fontFamily: 'Raleway reg',

                       ),
                       ),



                     ],


                  )

            )
        )
    );
  }

}

