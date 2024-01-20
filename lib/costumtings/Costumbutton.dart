import 'package:flutter/cupertino.dart';
import 'package:digital_consulting_platform/constant.dart';
class custumbutton extends StatelessWidget{
  final double hight, width;
  final double ?fontsize ;
  final String buttonname ;
  final Color ? buttencolor,fontcolor;
  final Function() onTap;

  custumbutton({
    required this.width,
    required this.hight,
    required this.buttonname,
    required this.onTap,
     this.fontsize,

     this.buttencolor,
     this.fontcolor,


  });


  @override
  Widget build(BuildContext context) {

  return GestureDetector(
    onTap: onTap
      ,
      child:  Container(

    height: hight,
    width: width,
    decoration: BoxDecoration(
      color: buttencolor ?? secondBackColor,
      borderRadius: BorderRadius.circular(50),

    ),
    child: Center (
    child : Text (
      buttonname,
      style:  TextStyle(
        color: fontcolor ?? white ,
        fontSize: fontsize ?? 20,
        fontFamily: "Raleway bold",



      ),
    )
    )
    ,
  )
  );

  }


}