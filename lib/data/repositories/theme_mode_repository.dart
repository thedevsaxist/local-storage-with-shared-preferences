import 'package:flutter/material.dart';
import 'package:local_storage_demo/data/datasources/shared_prefs_service.dart';

/// This is a repository of the local storage [SharedPrefsService]
class ThemeModeRepository {
  final SharedPrefsService _sharedPrefsService = SharedPrefsService();

  /// saves the theme mode to local storage [ThemeModeRepository]
  Future<void> saveTheme(ThemeMode value) async {
    await _sharedPrefsService.saveTheme(value);
  }

  /// retrieves the theme mode from local storage [ThemeModeRepository]
  ThemeMode getTheme() {
    return _sharedPrefsService.getTheme();
  }

  String getThemeName(){
    return _sharedPrefsService.getThemeName();
  }
}
