

import 'package:digital_consulting_platform/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ImagePrfile () {
  return Center(
    child:
    Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage('assets/images/profile2.jpg'),
        ),
        Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell (
            onTap: (){

            },
          child:  Icon(Icons.camera_alt,
            color: firstBackColor,
              size: 28.0,
            ) ,
        ))
      ],
    )
  ) ;
}
Widget bottomSheet (width){
  return Container(
    height: 100.0,
    width: width,
    margin: EdgeInsets.symmetric(
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
            TextButton.icon(onPressed:(){ } ,
              icon: Icon(Icons.camera) ,
              label: Text("Camera"),

            ),
            TextButton.icon(onPressed:(){ } ,
              icon: Icon(Icons.image) ,
              label: Text("Gallery"),

            ),

          ],

        )
      ],
    ) ,
  );
}