import 'package:digital_consulting_platform/constant.dart';
import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  final double width , height ;
  final String hinttext;
  final TextInputType ? keyboard ;
  final Function(String) onchange ;



  CostumTextField({
    required this.width,
    required  this.height,
    required this.hinttext,
    this.keyboard,
    required  this.onchange,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: secondBackColor.withAlpha(60),
        border: Border(
          top: BorderSide(width: 4, color: white.withAlpha(50)),
          left: BorderSide(width: 4 , color: white.withAlpha(50)),
          right: BorderSide(width: 4 , color: white.withAlpha(50)),
          bottom: BorderSide(width: 4 , color: white.withAlpha(50)),
        )
      ),
      child:  TextField(
        onChanged: onchange,
        cursorColor: white ,
        keyboardType: keyboard ?? TextInputType.text,
        style:  TextStyle(
          color: white ,
          fontSize:  20,
          fontFamily: 'Raleway reg',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: white ,
            fontSize: 16,
            fontFamily: 'Raleway reg',
          ),

            contentPadding: EdgeInsets.fromLTRB(30, 8, 8, 8)
        ),

      ),

    );

  }

}
