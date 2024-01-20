import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/pages/landing/landing_controller.dart';
import 'package:digital_consulting_platform/translation/trclass.dart';
import 'package:flutter/material.dart';
import 'package:digital_consulting_platform/costumtings/Costumbutton.dart';
import 'package:get/get.dart';
class landing  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
    child:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: gradientBackground ,
        child: ListView(

          children: [
      h(),
          SizedBox(height:20 ,
          width: MediaQuery.of(context).size.width*0.25 ,),
           Image.asset('assets/images/logo3.png' ,fit: BoxFit.contain
             ,height: 300 , width: 300,),

             Text(
              'Welcome'.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Raleway bold',
              ),
                textAlign: TextAlign.center,
            ),
            SizedBox(height:20 ,),
            Text(
    'Choose how you want to Sign up :'.tr,
    style: TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontFamily: 'Raleway reg',


    ),

            ),
            SizedBox(height:50 ,),
            Row(
              children: [
                SizedBox(width:15 ,),

                custumbutton(
                  width : MediaQuery.of(context).size.width*.4 ,
                  hight: 130,
                  fontsize :20,
                  buttonname: 'As a User '.tr,
                  onTap: (){
                    Get.toNamed('/signupUser');
                  },

                ),

                SizedBox(width:50 ,),
                custumbutton(
                  width : MediaQuery.of(context).size.width*.4 ,
                  hight: 130,
                  fontsize :20,
                  buttonname: 'As an Expert '.tr,
                  onTap: (){
               Get.toNamed('/signupEx');
                  },

                ),

              ],
            )



          ],
        ),
      ),
      )
    );
  }
}
