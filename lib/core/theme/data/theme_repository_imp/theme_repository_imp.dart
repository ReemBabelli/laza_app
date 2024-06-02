import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:laza_app/core/theme/data/local/theme_local_data_source.dart';
import 'package:laza_app/core/theme/domain/repositories/repository.dart';

class ThemeRepositoryImp implements ThemeRepository{
  final ThemeLocaleDataSource localeDataSource;

  ThemeRepositoryImp({required this.localeDataSource});
  @override
  Future<Unit> cacheTheme(String theme)async {
  localeDataSource.cacheTheme(theme);
  return Future.value(unit);
  }

  @override
  Future<ThemeMode> getCachedTheme()async {
 final theme = await localeDataSource.getCachedTheme();
 return Future.value(theme);
  }

}