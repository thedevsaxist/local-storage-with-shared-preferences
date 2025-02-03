import 'package:flutter/material.dart';
import 'package:local_storage_demo/data/repositories/theme_mode_repository.dart';

class ThemeModeSelectorViewModel extends ChangeNotifier {
  final ThemeModeRepository _repository;

  ThemeModeSelectorViewModel(this._repository);

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
    await _repository.saveTheme(themeMode);
  }

  Future<void> getThemeMode() async {
    _themeMode = await _repository.getTheme();
    notifyListeners();
  }
}
