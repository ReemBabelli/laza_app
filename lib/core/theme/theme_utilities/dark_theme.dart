import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff222E34),
    textTheme: darkTextTheme,

    appBarTheme: AppBarTheme(backgroundColor:Color(0xff222E34) ),
    colorScheme: const ColorScheme.dark(
      background: Color(0xff222E34),
      primary: Color(0xff29363D),
      secondary: Color(0xff808080),
    ));


TextTheme darkTextTheme = const TextTheme(

    titleSmall: TextStyle(
      fontSize: 14.0,
      color: Color(0xff8F959E),
    ),

  labelLarge: TextStyle(
    fontSize: 14.0,
    color: Color(0xffFFFFFF),
  ),

    titleMedium: TextStyle(
      fontSize: 16.0,
      color: Color(0xff8F959E),
    ),

  titleLarge: TextStyle(
    fontSize: 16.0,
    color: Color(0xffFFFFFF),
  ),

  headlineSmall: TextStyle(
    fontSize: 22.0,
    color: Color(0xffFFFFFF),
  ),

  bodyMedium: TextStyle(
    fontSize: 14.0,
    color: Color(0xff9775FA),
  ),
);