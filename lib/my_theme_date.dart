import 'package:flutter/material.dart';

class MyThemeDate {
  static final lightTheme = ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        headline4: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        headline3: TextStyle(color: Colors.black, fontSize: 27),
        headline2: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ));
}
