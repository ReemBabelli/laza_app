import 'package:dartz/dartz.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/theme/cubit/theme_states.dart';
import 'package:laza_app/core/theme/domain/use_cases/cache_theme_use_case.dart';
import 'package:laza_app/core/theme/domain/use_cases/get_cached_theme_use_case.dart';
import 'package:laza_app/core/theme/theme_utilities/dark_theme.dart';
import 'package:laza_app/core/theme/theme_utilities/light_theme.dart';

class ThemeCubit extends Cubit<ThemeStates>{
  final GetCachedThemeUseCase getCachedThemeUseCase;
  final CacheThemeUseCase cacheThemeUseCase;

  ThemeCubit( {required this.getCachedThemeUseCase, required this.cacheThemeUseCase}):  super(ThemeInitial()) ;

  Future<Unit> getCachedTheme() async {
    final ThemeMode themeMode = await getCachedThemeUseCase();
    emit(SwitchThemeState(themeMode: themeMode));
    return unit;
  }


  Future<Unit> cacheTheme(String theme) async {
    ThemeMode themeMode;
    await cacheThemeUseCase(theme);
    if(theme == 'dark'){
      themeMode = ThemeMode.dark;
    }else{
      themeMode =ThemeMode.light;
    }
    emit(SwitchThemeState(themeMode: themeMode));
    return Future.value(unit);
  }

}
