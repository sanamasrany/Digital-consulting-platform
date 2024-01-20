//import 'package:digital_consulting_platform/pages/main_page/main_page.dart';
import 'dart:io';






import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfield.dart';
import 'package:digital_consulting_platform/costumtings/costumtextfieldpassword.dart';
import 'package:digital_consulting_platform/models/expert_profile_details.dart';
import 'package:digital_consulting_platform/pages/expert_main_pages/expert_main_controller.dart';
import 'package:digital_consulting_platform/pages/signup_expert/hero_dialoge_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



String _e ='edit';

class ExpertPerProfile extends StatelessWidget {
  Expert ex ;

  ExpertPerProfile({
     required this.ex
});
  ExpertMainPageController controller = Get.put(ExpertMainPageController());



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
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 20,),
                Center(
                    child:

                          CircleAvatar(
                            radius: 80.0,
                            backgroundImage:
                            ex.imgpath != 'null'
                           ? NetworkImage('${ServerConfig.domainNameserver}/${ex.imgpath}')
                          : AssetImage('assets/images/profile2.jpg')as ImageProvider,
                        ),

                ),
                  const SizedBox(height: 24),
                 Center(
                  child: Text(
                      'Name : ${ex.name}',
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
                   "Experinces : ${ex.experinces}" ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway bold",
                      color: white,)
                ),
                const SizedBox(height: 24),

                Text(
                    "Email : ${ex.email}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway bold",
                      color: white,)
                ),
                const SizedBox(height: 24),
                Text(
                   "Phone Number : ${ex.phonenumber}" ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway bold",
                      color: white,)
                ),
                const SizedBox(height: 24),
                Text(
                    'My wallet : ${ex.wallet.toString()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway bold",
                      color: white,)
                ),
                SizedBox(height: 24),
                Hero(tag: _e, child:  Center(

                  child: ElevatedButton(

                      onPressed: () {
                        Navigator.of(context).push(HeroDialogRoute(
                          builder : (context){
                            return _EditExpertPopCard(ex);
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
                const SizedBox(height: 100),
                Text(
                    'do you want to use the app as a person who want a consult : '.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway reg",
                      color: white,)
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        onClickhere();

                      },
                      // ignore: sort_child_properties_last
                      child:  Text(
                        "click here".tr,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "Raleway bold",
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          shadowColor: Colors.black,
                        backgroundColor: firstBackColor

                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

              ],
            ),
          ),
        ));
  }



  void onClickhere() async {


    EasyLoading.show(status: 'loading..',
    );
    await controller.convertToUser(); // prog cant do anything under till this fun ends
    if (controller.coverttouserStatus) { // has true or false depends on api
      EasyLoading.showSuccess(controller.message ,duration: Duration(seconds: 1 ) , dismissOnTap: true );
      Get.offNamed('/splash'); //so it dont returns to signup again
    }else{
      EasyLoading.showError(controller.message , duration: Duration(seconds: 1 ) , dismissOnTap: true );
      print('error');

    }
  }
}

class _EditExpertPopCard extends StatelessWidget {
  Expert e;
  _EditExpertPopCard(this.e);

  ExpertMainPageController controller = Get.put(ExpertMainPageController());



  File? pickedFile   ;
  ImagePicker imagePicker = ImagePicker();

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
                child:
                Stack(
                children: <Widget>[
                    Obx(() =>  CircleAvatar(
                radius: 80.0,
                backgroundImage: controller.isprofilpicset.value == true
                    ?FileImage(File(controller.profilePicPath.value)) as ImageProvider
                    :
                e.imgpath != "null"
                    ? NetworkImage('${ServerConfig.domainNameserver}/${e.imgpath}')
                    : AssetImage('assets/images/profile2.jpg')as ImageProvider,
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
                    color: white,
                    size: 28.0,
                  ),
                ))
            ],
          )
        ),

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
                      hinttext: e.name,

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
                      hinttext: e.email,

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
                      hinttext: e.phonenumber,
                      keyboard: TextInputType.phone,
                      onchange: (value) {
                        controller.phonenumber = value ;
                      },
                    ),
                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: e.address,
                      keyboard: TextInputType.phone,
                      onchange: (value) {
                        controller.phonenumber = value ;
                      },
                    ),
                    SizedBox(height: 10,),
                    CostumTextField(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      hinttext: e.experinces,
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
  void takephoto (ImageSource source)async{
    final pickedImage = await imagePicker.pickImage(source: source , imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    print(pickedFile);
    controller.setProfileImagePath(pickedFile!.path);
  }


  void onClicksubmitedit() async {


    EasyLoading.show(status: 'loading..',
    );
    if (pickedFile!.path != null) {
      await controller.editOnClick(pickedFile!.path);


      if (controller.editStatus) { // has true or false depends on api
        EasyLoading.showSuccess(
            controller.message, duration: Duration(seconds: 1),
            dismissOnTap: true);
        Get.offAllNamed('/Expertmain'); //so it dont returns to signup again
      } else {
        EasyLoading.showError(
            controller.message, duration: Duration(seconds: 1),
            dismissOnTap: true);
        print('error');
      }
    } else {

      await controller.editOnClick(e.imgpath);


      if (controller.editStatus) { // has true or false depends on api
        EasyLoading.showSuccess(
            controller.message, duration: Duration(seconds: 1),
            dismissOnTap: true);
        Get.offAllNamed('/Expertmain'); //so it dont returns to signup again
      } else {
        EasyLoading.showError(
            controller.message, duration: Duration(seconds: 1),
            dismissOnTap: true);
        print('error');
      }

    }
  }

}



