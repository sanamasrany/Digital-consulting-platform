import 'dart:io';

import 'package:digital_consulting_platform/getx_bindings/chating_bindings.dart';
import 'package:digital_consulting_platform/getx_bindings/expert_main_page_bindings.dart';

import 'package:digital_consulting_platform/getx_bindings/fav_page_bindings.dart';

import 'package:digital_consulting_platform/getx_bindings/landing_binding.dart';
import 'package:digital_consulting_platform/getx_bindings/main_page_binding.dart';
import 'package:digital_consulting_platform/getx_bindings/reserved_user_bindings.dart';

import 'package:digital_consulting_platform/getx_bindings/signup_User_binding.dart';
import 'package:digital_consulting_platform/getx_bindings/signup_ex_binding.dart';
import 'package:digital_consulting_platform/getx_bindings/splash_binding.dart';
import 'package:digital_consulting_platform/getx_bindings/user_profile_binding.dart';
import 'package:digital_consulting_platform/pages/chat_page/chating_page.dart';


import 'package:digital_consulting_platform/pages/expert_main_pages/expert_main_reserved_times.dart';

import 'package:digital_consulting_platform/pages/favorite_page/favorite_page.dart';
import 'package:digital_consulting_platform/pages/landing/landing.dart';
import 'package:digital_consulting_platform/pages/login/login.dart';
import 'package:digital_consulting_platform/pages/main_page/main_page.dart';
import 'package:digital_consulting_platform/pages/reserved_user_page/reserved_user_view.dart';
import 'package:digital_consulting_platform/pages/signin/signin.dart';

import 'package:digital_consulting_platform/pages/signup_expert/signup_ex.dart';
import 'package:digital_consulting_platform/pages/splash/splash.dart';

import 'package:digital_consulting_platform/translation/translate.dart';
import 'package:digital_consulting_platform/user_profile/user_profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:digital_consulting_platform/getx_bindings/login_binding.dart';



void main() {


  runApp(




   GetMaterialApp( //same as materialapp but for get package ia easier
     initialRoute: '/splash', //the page that the prog will start from
     getPages: [
       GetPage(name: '/login' ,page: ()=> login() , binding: loginBinding() ),
       GetPage(name: '/landing' ,page: ()=> landing(), binding: landingBinding() ),
       GetPage(name: '/signupUser', page: ()=> SignUp()  , binding: signupuserbinding()),
       GetPage(name: '/mainpage', page: ()=> NavigationBarr() , binding: MainPageBinding()),
       GetPage(name: '/splash' ,page: ()=> Splash() , binding: SplashBinding() ),
       GetPage(name: '/userprofile', page: ()=> Profile()  , binding: UserProfileBinding() ),
       GetPage(name: '/signupEx', page: ()=> SignUpEX(), binding: signupEXbinding() ),
      GetPage(name: '/reserveduser', page: ()=> ReservedUserView(), binding: ReservedUserBinding() ),
       GetPage(name: '/chat', page: ()=> Chats(), binding: ChatPageBinding() ),
       GetPage(name: '/favorite', page: ()=> FavoritePage(), binding: FAVPageBinding() ),
       GetPage(name: '/Expertmain', page: ()=> ReservedPage(), binding: ExpertMainPageBinding() ),


     ],
translations: Translation(),
 locale: Locale('en'),
 fallbackLocale: Locale('en'),
 builder: EasyLoading.init() ,
     debugShowCheckedModeBanner: false,
   )

  );

}

