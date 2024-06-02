import 'package:dartz/dartz.dart';
import 'package:laza_app/core/theme/domain/repositories/repository.dart';

class CacheThemeUseCase{
  final ThemeRepository repository;

  CacheThemeUseCase({required this.repository});

  Future<Unit> call(String theme)async{
    return await repository.cacheTheme(theme);
  }
}