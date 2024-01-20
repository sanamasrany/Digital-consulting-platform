
import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/models/expertmainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{

  final List<Expert>  favlist = [];
  List<Expert>  get favs => favlist;

  void togglefav (Expert favex ){
    final isExist = favlist.contains(favex);
    if(isExist){
      favlist.remove(favex);
    }else{
      favlist.add(favex);

    }
    notifyListeners();
  }
  bool isExist (Expert expert){
    final isExist = favlist.contains(expert);
    return isExist;
  }
}