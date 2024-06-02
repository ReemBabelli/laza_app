import 'package:flutter/material.dart';
import 'package:laza_app/core/theme/domain/repositories/repository.dart';

class GetCachedThemeUseCase{
  final ThemeRepository repository;

  GetCachedThemeUseCase({required this.repository});

  Future<ThemeMode> call()async{
    return await repository.getCachedTheme();
  }
}