import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(

  brightness: Brightness.light,

  textTheme: lightTextTheme,

    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary:Color(0xffececec),
      secondary:Color(0xff29363D),
    ),
);


TextTheme lightTextTheme = const TextTheme(
    titleSmall: TextStyle(
      fontSize: 14.0,
      color: Color(0xff8F959E),
    ),

  labelLarge: TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  ),

    titleMedium: TextStyle(
      fontSize: 16.0,
      color: Color(0xff8F959E),
    ),

  titleLarge: TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  ),

  headlineSmall: TextStyle(
    fontSize: 22.0,
    color: Colors.black,
  ),

  bodyMedium: TextStyle(
    fontSize: 14.0,
    color: Color(0xff8F959E),
  ),
);