// // ignore_for_file: no_logic_in_create_state, file_names
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // ignore: unused_import
//
//
// class Mpage extends StatelessWidget {
//   const Mpage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: PageView(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset("assets/images/y.png"),
//                 const Text(
//                   "Medical department",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "Bilbo Swash Caps",
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 17, 7, 65),
//                   ),
//                 ),
//                 const Text(
//                   "Get a doctor's advice while you are at home",
//                   style: TextStyle(
//                     color: Color.fromARGB(221, 72, 68, 68),
//
//                     fontFamily: "Philosopher",
//                     fontSize: 18, fontWeight: FontWeight.bold, //shadows: []
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset("assets/images/bb.jpeg"),
//                 const Text(
//                   "Psychological department",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "Bilbo Swash Caps",
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 17, 7, 65),
//                   ),
//                 ),
//                 const Text(
//                   "We provide psychological counseling",
//                   style: TextStyle(
//                     fontFamily: "Philosopher",
//                     color: Color.fromARGB(221, 72, 68, 68),
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset("assets/images/c.jpeg"),
//                 const Text(
//                   "Business/Management consulting",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "Bilbo Swash Caps",
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 17, 7, 65),
//                   ),
//                 ),
//                 const Text(
//                   "Get the best advice for your business",
//                   style: TextStyle(
//                     fontFamily: "Philosopher",
//                     color: Color.fromARGB(221, 72, 68, 68),
//                     fontSize: 18, fontWeight: FontWeight.bold, //shadows: []
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset("assets/images/g.png"),
//                 const Text(
//                   "Family Consulting Department",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "Bilbo Swash Caps",
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 17, 7, 65),
//                   ),
//                 ),
//                 const Text(
//                   "Ask for your family advice now",
//                   style: TextStyle(
//                     color: Color.fromARGB(221, 72, 68, 68),
//
//                     fontFamily: "Philosopher",
//                     fontSize: 18, fontWeight: FontWeight.bold, //shadows: []
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset("assets/images/a.jpeg"),
//                 const Text(
//                   "Professional Consulting",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "Bilbo Swash Caps",
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 17, 7, 65),
//                   ),
//                 ),
//                 const Text(
//                   " For a good job",
//                   style: TextStyle(
//                     fontFamily: "Philosopher",
//                     color: Color.fromARGB(221, 72, 68, 68),
//
//                     fontSize: 18, fontWeight: FontWeight.bold, //shadows: []
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Get.offNamed('/login');
//                     //move to assign
//                   },
//                   // ignore: sort_child_properties_last
//                   child: const Text(
//                     "Get Start",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontFamily: "Philosopher",
//                     ),
//                   ),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           const Color.fromARGB(149, 3, 168, 244))),
//                   //icon: const Icon(Icons.near_me),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
