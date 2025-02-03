import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // create a static instance of the class [SharedPrefsService], calling _internal() of _()

  static final SharedPrefsService _instance = SharedPrefsService._();

  // create an instance of shared preference
  SharedPreferences? _preferences;

  // create a factory of the class [SharedPrefsService]
  factory SharedPrefsService() => _instance;

  // call the instance value
  SharedPrefsService._();

  // create a method to initialize the local storage
  Future<void> initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Saves the user's details to local storage [SharedPrefsService]
  Future<void> saveDetails(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  /// retrieves the user's details from local storage [SharedPrefsService]
  String? getDetails(String key) {
    return _preferences?.getString(key);
  }

  /// saves the last toggle state of the switch to local storage [SharedPrefsService]
  Future<void> saveToggleState(String key, bool state) async {
    await _preferences?.setBool(key, state);
  }

  /// retrieves the last toggle state of the switch from local storage [SharedPrefsService]
  bool? getToggleState(String key) {
    return _preferences?.getBool(key);
  }

  /// saves the theme mode to local storage [SharedPrefsService]
  Future<void> saveTheme(ThemeMode themeMode) async {
    await _preferences?.setInt('themeMode', themeMode.index);
  }

  /// retrieves the theme mode from local storage [SharedPrefsService]
  ThemeMode getTheme() {
    final themeIndex =
        _preferences?.getInt('themeMode') ?? ThemeMode.system.index;
    return ThemeMode.values[themeIndex];
  }

  /// removes all saved data in local storage [SharedPrefsService]
  Future<void> clearCache() async {
    await _preferences?.clear();
  }
}
