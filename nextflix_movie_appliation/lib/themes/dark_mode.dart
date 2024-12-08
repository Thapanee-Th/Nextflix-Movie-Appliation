import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  appBarTheme: AppBarTheme(
    color: Colors.deepPurple,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.deepPurple),
    trackColor: MaterialStateProperty.all(Colors.deepPurple.shade200),
  ),
  // Use titleMedium in TextTheme for the AppBar title in Flutter 3.24.4
  textTheme: TextTheme(
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 20), // Custom AppBar text style
  ),
);
