import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/theme_utilities/dark_theme.dart';
import 'package:laza_app/core/theme/theme_utilities/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocaleDataSource{
  Future<Unit> cacheTheme(String theme);
  Future<ThemeMode> getCachedTheme();
}

class ThemeLocaleDataSourceImp implements ThemeLocaleDataSource{
  final SharedPreferences sharedPreferences;

  ThemeLocaleDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheTheme(String theme)async {
   await sharedPreferences.setString("theme", theme);
   return Future.value(unit);
  }

  @override
  Future<ThemeMode> getCachedTheme() {
    ThemeMode themeMode;
   final theme = sharedPreferences.getString("theme");
   if(theme == "dark"){
     themeMode = ThemeMode.dark;
   }
   else{
     themeMode = ThemeMode.light;
   }
   return Future.value(themeMode);
  }

}