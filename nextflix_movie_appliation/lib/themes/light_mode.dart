import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.blue),
    trackColor: MaterialStateProperty.all(Colors.blue.shade200),
  ),
  // Use titleMedium in TextTheme for the AppBar title in Flutter 3.24.4
  textTheme: TextTheme(
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 20), // Custom AppBar text style
  ),
);
