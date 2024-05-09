import 'package:flutter/material.dart';
class MonTheme extends ChangeNotifier{
  static String mode="Light";
  void setMode(String m){
    mode= m;
    notifyListeners();
  }
  ThemeData getTheme(){
    return (mode=="Light")?ThemeData.light():ThemeData.dark();
  }
}