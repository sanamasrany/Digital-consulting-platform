//login view
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfieldpassword.dart';
import 'package:digital_consulting_platform/getx_bindings/landing_binding.dart';
import 'package:digital_consulting_platform/pages/landing/landing.dart';
import 'package:digital_consulting_platform/pages/login/login_controller.dart';

import 'package:digital_consulting_platform/translation/trclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:digital_consulting_platform/costumtings/Costumbutton.dart';
import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfield.dart';

class login extends StatelessWidget {
 loginController controller = Get.find(); //find me the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child:

        Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: gradientBackground ,

          child: ListView(

            children: [
              h(),

              SizedBox(height:20 ,
              width: MediaQuery.of(context).size.width*0.25 ,

              ),
              Image.asset('assets/images/logo3.png' , fit: BoxFit.contain
                ,height: 300 , width: 300,),
              Center(
           child :    Text(
                  'Welcome Back'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Raleway bold',
                  )),
              ),
              SizedBox(height:10 ,),
            Center(
              child :  Text(
                'Login with :'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Raleway reg',


                ),

              ),),

              SizedBox(height:20 ,),
              Column(
                children : [
              CostumTextField(
                height : 60,
                width : MediaQuery.of(context).size.width*0.9,
                hinttext : 'Email'.tr,
                onchange: (value){
                  controller.email = value;
                },
              ),

              SizedBox(height:10 ,),
              CostumTextFieldPassword(
                height : 60,
                width : MediaQuery.of(context).size.width * 0.9,
                hinttext : 'Password'.tr,
                onchange: (value){
               controller.password = value;
                },
              ),

                 Center(
                   child : Row (
                     mainAxisAlignment: MainAxisAlignment.end,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                  Obx(() {
                    return Checkbox(value: controller.checkBoxStatuse.value ,
                         onChanged: (bool? value) {
                      controller.changeCheckBox();
                         },
                    );

                  }),
                       Text(
                         "remember me  ".tr,
                         style: TextStyle(
                           color: Colors.white ,
                           fontSize: 18,
                           fontFamily: 'Raleway reg',
                         ),

                       ),
                         SizedBox(width: 20,)
                     ] )),


         //            GestureDetector(
         // child:     Text(
         //        'Forgot Your Password ?'.tr,
         //        style: TextStyle(
         //          color: Colors.white ,
         //          fontSize: 18,
         //          fontFamily: 'Raleway reg',
         //          decoration:  TextDecoration.underline,
         //        ),
         //      ),
         //          ),

              SizedBox(height:20 ,),
                  custumbutton(
                    width : MediaQuery.of(context).size.width*.9 ,
                    hight: 70,
                    fontsize :20,
                    buttonname: 'LOGIN'.tr,
                    onTap: (){

                     onClicklogin(context);
                    },

                  ),
                  SizedBox(height:10 ,),
                  Row(

                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.15,),
                        Text(
                          'Don`t have an account ? '.tr,
                          style: TextStyle(
                            color: firstBackColor ,
                            fontSize: 18,
                            fontFamily: 'Raleway reg',
                          ),
                        ),
                        GestureDetector(
                          child:     Text(
                            ' sign up !'.tr,
                            style: TextStyle(
                              color: firstBackColor ,
                              fontSize: 18,
                              fontFamily: 'Raleway reg',
                              decoration:  TextDecoration.underline,
                            ),
                          ),
                          onTap: (){
                            Get.offNamed('/landing');
                          },
                        ),
                      ]  ),
                  SizedBox(height: 20,),

                ] ),
                ],
              )




          ),

      ),
      );


  }
 void onClicklogin(context) async {
   EasyLoading.instance
     ..displayDuration = const Duration(milliseconds: 2000)
     ..indicatorType = EasyLoadingIndicatorType.wave
     ..loadingStyle = EasyLoadingStyle.light
     ..indicatorSize = 45.0
     ..radius = 10.0
     ..progressColor = Colors.yellow
     ..backgroundColor = white.withAlpha(100)
     ..indicatorColor = Colors.white
     ..textColor = Colors.white
     ..maskColor = secondBackColor.withOpacity(0.5)
     ..maskType= EasyLoadingMaskType.custom
     ..userInteractions = true
     ..dismissOnTap = false;

   EasyLoading.show(status: 'loading..',
   );
   await controller.loginOnClick(); // prog cant do anything under till this fun ends
   if (controller.loginStatus) { // has true or false depends on api
     EasyLoading.showSuccess(controller.message ?? 'login successful' ,duration: Duration(seconds: 10 ) , dismissOnTap: true );
     UserInformation.user_type == "expert"
     ? Get.offAllNamed('/Expertmain')
     :Get.offAllNamed('/mainpage'); //so it dont returns to signup again
   }else{
     EasyLoading.showError(controller.message?? 'error' , duration: Duration(seconds: 10 ) , dismissOnTap: true );
     print('error');

   }
 }
}

