import 'package:flutter/material.dart';

class ThemeModeSelector extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void changeToDarkMode() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void changeToLightMode() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void changeToSystem() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}
