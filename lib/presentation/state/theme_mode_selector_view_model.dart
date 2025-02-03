import 'package:flutter/material.dart';
import 'package:local_storage_demo/data/repositories/theme_mode_repository.dart';

class ThemeModeSelectorViewModel extends ChangeNotifier {
  final ThemeModeRepository _repository;

  ThemeModeSelectorViewModel(this._repository);

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  String _themeName = 'system';
  String get themeName => _themeName;

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    _themeName = themeMode.name;
    notifyListeners();
    await _repository.saveTheme(themeMode);
  }

  Future<void> getThemeMode() async {
    // ignore: await_only_futures
    _themeMode = await _repository.getTheme();
    notifyListeners();
  }

  Future<void> getThemeName() async{
    // ignore: await_only_futures
    _themeName = await _repository.getThemeName();
    notifyListeners();
  }
}
