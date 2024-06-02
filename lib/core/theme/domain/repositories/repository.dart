import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class ThemeRepository{

  Future<Unit> cacheTheme(String theme);
  Future<ThemeMode> getCachedTheme();
}