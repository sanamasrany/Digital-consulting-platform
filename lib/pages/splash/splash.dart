import 'package:digital_consulting_platform/constant.dart';
import 'package:digital_consulting_platform/pages/splash/nextsplash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea (
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: gradientBackground ,
        child: Image.asset('assets/images/logo3.png'),
      ),
    ),
  );
  }

}
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class Splash extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splashIconSize: 700,
//       backgroundColor: const Color.fromARGB(255, 128, 172, 249),
//       splash: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Container(
//             padding:
//             const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
//             //   height: 100,
//             width: double.infinity,
//             child: const Text("Welcome\n to our digital platforme",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: "Philosopher",
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   shadows: [
//                     Shadow(
//                         color: Color.fromARGB(248, 0, 0, 0),
//                         blurRadius: 3.0,
//                         offset: Offset(3, 3))
//                   ],
//                   color: Colors.white,
//                 ))),
//         const CircleAvatar(
//             radius: 150, backgroundImage: AssetImage("assets/images/sp.jpeg")),
//       ]),
//       nextScreen: const Mpage(),
//     );
//   }
// }
