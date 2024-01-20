//signup user view
import 'package:digital_consulting_platform/costumtings/costumtextfieldpassword.dart';
import 'package:digital_consulting_platform/pages/signin/signin_controller.dart';
import 'package:digital_consulting_platform/translation/trclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:digital_consulting_platform/costumtings/Costumbutton.dart';
import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfield.dart';

class SignUp extends StatelessWidget {
  signinController controller = Get.find(); //find me the controller

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

                Image.asset('assets/images/logo3.png',fit: BoxFit.contain
                  ,height: 300 , width: 300,),

                Center(
                  child: Text(
                    'Sign Up :'.tr,
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
                      CostumTextFieldPassword(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'Confirm Password'.tr,
                        onchange: (value) {
                          controller.passwordConfirm = value;
                        },
                      ),
                      SizedBox(height: 10,),
                      CostumTextField(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9,
                        hinttext: 'Phone number'.tr,
                        keyboard: TextInputType.phone,
                        onchange: (value) {
                          controller.phonenumber = value;
                        },
                      ),
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
                          onClickSignup();
                        },

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
                              onTap: (){
                                Get.offNamed('/login');
                              },
                            ),
                          ]),
                   SizedBox(height: 20,)

                    ]),
              ],
            )


        ),

      ),
    );
  }


  void onClickSignup() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.wave
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;

    EasyLoading.show(status: 'loading..',
    );
    await controller.signupOnClick(); // prog cant do anything under till this fun ends
    if (controller.signupStatus) { // has true or false depends on api
      EasyLoading.showSuccess(controller.message ,duration: Duration(seconds: 10 ) , dismissOnTap: true );
      Get.offNamed('/mainpage'); //so it dont returns to signup again
    }else{
      EasyLoading.showError(controller.message , duration: Duration(seconds: 10 ) , dismissOnTap: true );
      print('error');

   }
  }
}

