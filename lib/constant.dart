
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';


const Color firstBackColor = Color(0xff553141) ;
const Color secondBackColor = Color(0xffe18b86) ;
const Color thirdBackColor = Color(0xffffbb80) ;
const Color fourthBackColor = Color(0xfffed8a7) ;
// const Color firstBackColor = Color.fromARGB(255, 84, 58, 197) ;
// const Color secondBackColor =Color.fromARGB(255, 71, 91, 187)  ;
// const Color thirdBackColor =Color.fromARGB(255, 96, 103, 210);
// const Color fourthBackColor = Color.fromARGB(255, 139, 142, 206);
const Color white = Color(0xFFFFFFFF) ;
const BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          firstBackColor,
          secondBackColor,
          thirdBackColor,
          fourthBackColor

        ]
    )

 );
//  void configLoading() {
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
//     ..dismissOnTap = true;
//
// }