import 'package:flutter/material.dart';

@immutable
abstract class ThemeStates{}

class ThemeInitial extends ThemeStates{}

class SwitchThemeState extends ThemeStates{
  final ThemeMode themeMode;

  SwitchThemeState({required this.themeMode});
}