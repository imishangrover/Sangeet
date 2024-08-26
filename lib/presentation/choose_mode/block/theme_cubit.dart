import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    switch (json['themeMode']) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        throw Exception('Invalid theme mode');
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    switch (state) {
      case ThemeMode.system:
        return {'themeMode': 'system'};
      case ThemeMode.light:
        return {'themeMode': 'light'};
      case ThemeMode.dark:
        return {'themeMode': 'dark'};
    }
  }
}