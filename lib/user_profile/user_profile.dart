//import 'package:digital_consulting_platform/pages/main_page/main_page.dart';



import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfield.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfieldpassword.dart';
import 'package:digital_consulting_platform/models/user_profile_details_model.dart';
import 'package:digital_consulting_platform/pages/signup_expert/hero_dialoge_route.dart';
import 'package:digital_consulting_platform/user_profile/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


import '../constant.dart';

String _e ='edit';

class Profile extends StatelessWidget {





  UserProfileController controller = Get.put(UserProfileController()) ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "My Profile".tr,
          style: TextStyle(
            fontSize: 20,

            color: Color.fromARGB(255, 255, 252, 252),
            fontFamily: "Raleway bold",
          ),
        ),
        leading: const BackButton(),
        elevation: 10,
        backgroundColor: firstBackColor,
      ),
      body:  SafeArea(
    child:

    Container(


    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: gradientBackground ,
    child: Obx (() {
    if (controller.loadingu.isTrue) {
    return Center(
    child: CircularProgressIndicator(),
    );
    }
    return

    ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 5,),
            Center(
                child:


                    Image.asset('assets/images/logo3.png' , fit: BoxFit.contain
                      ,height: 300 , width: 300,),



            ),
              //const SizedBox(height: 24),
             Center(
             child: Text(
                'Name : ${controller.userdet.name}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway bold",
                  color: white,)

            ),
            ),
            const SizedBox(height: 24),


            Text(
                'Email : ${controller.userdet.email}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway bold",
                  color: white,)
            ),
            const SizedBox(height: 24),


            Text(
                'Phone Number : ${controller.userdet.phonenumber}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway bold",
                  color: white,)
            ),

            const SizedBox(height: 24),


             Text(
              'My wallet : ${controller.userdet.wallet.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway bold",
                  color: white,)
            ),

            const SizedBox(height: 24),
      Hero(tag: _e, child:  Center(

              child: ElevatedButton(

                  onPressed: () {
                    Navigator.of(context).push(HeroDialogRoute(
                      builder : (context){
                        return _EditUserPopCard(controller.userdet);
                      },
                    )
                    );

                  },

                  // ignore: sort_child_properties_last
                  child:  Text(
                    "Edit My profile".tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Raleway bold",
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      shadowColor: Colors.black,
                      backgroundColor: firstBackColor)
                //icon: const Icon(Icons.near_me),
              ),
            )),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(

                onPressed: () {

                  onClicklogout();
                },

                // ignore: sort_child_properties_last
                child:  Text(
                  "logout".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: "Raleway bold",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    shadowColor: Colors.black,
                backgroundColor: firstBackColor)
                //icon: const Icon(Icons.near_me),
              ),
            ),
          ],
        );

    })
    )
    )
    );
  }
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

class _EditUserPopCard extends StatelessWidget {
  User u ;
  _EditUserPopCard(this.u);

  UserProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Hero(
          tag: _e ,

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
                        'New profile information :'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway bold',


                        ),

                      ),),

                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: u.name,

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
                      hinttext: u.email,

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
                      hinttext: UserInformation.user_password,

                      onchange: (value) {
controller.password = value ;
                      },
                    ),
                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: u.phonenumber,
                      keyboard: TextInputType.phone,
                      onchange: (value) {
controller.phonenumber = value ;
                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(

                        onPressed: () {
                          onClicksubmitedit();

                        },

                        // ignore: sort_child_properties_last
                        child:  Text(
                          "submit".tr,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Raleway bold",
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            shadowColor: Colors.black,
                            backgroundColor: firstBackColor)
                      //icon: const Icon(Icons.near_me),
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
  void onClicksubmitedit() async {


    EasyLoading.show(status: 'loading..',
    );
    await controller.editOnClick(); // prog cant do anything under till this fun ends
    if (controller.editStatus) { // has true or false depends on api
      EasyLoading.showSuccess(controller.message ,duration: Duration(seconds: 1 ) , dismissOnTap: true );
      Get.offAllNamed('/mainpage');//so it dont returns to signup again
    }else{
      EasyLoading.showError(controller.message , duration: Duration(seconds: 1 ) , dismissOnTap: true );
      print('error');

    }
  }

}



