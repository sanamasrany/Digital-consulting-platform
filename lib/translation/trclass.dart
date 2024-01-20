import 'package:flutter/material.dart';
import 'package:get/get.dart';

class h extends StatefulWidget {
  @override
  _h createState()=>_h();


}
class _h extends State<h>{
  String _selectedlang='en' ;
  @override
  Widget build(BuildContext context) {
    return   DropdownButton(items: [
      DropdownMenuItem(child:
      Text("English"),
        value: 'en',
      ),
      DropdownMenuItem(child:
      Text("Arabic"),
        value: 'ar',
      ),
    ],
        value: _selectedlang,
        onChanged: (value){
          setState(() {
            _selectedlang = value!;
          });
          Get.updateLocale(Locale(_selectedlang));
        });
  }

}