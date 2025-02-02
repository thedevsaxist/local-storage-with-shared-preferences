import 'package:flutter/foundation.dart';
import 'package:local_storage_demo/data/datasources/shared_prefs_service.dart';

/// This is a repository of the local storage [SharedPrefsService]
class SharedPrefsRepository {
  final SharedPrefsService _sharedPrefsService = SharedPrefsService();

  /// Saves the user's details to local storage [SharedPrefsRepository]
  Future<void> saveDetails({required String key, required String value}) {
    return _sharedPrefsService.saveDetails(
      key,
      value,
    );
  }

  /// retrieves the user's details from local storage [SharedPrefsRepository]
  String? getDetails(String key) {
    return _sharedPrefsService.getDetails(key);
  }

  /// saves the last toggle state of the switch to local storage [SharedPrefsRepository]
  Future<void> saveToggleState({required String key, required bool state}) {
    return _sharedPrefsService.saveToggleState(key, state);
  }

  /// retrieves the last toggle state of the switch to local storage [SharedPrefsRepository]
  bool? getToggleState(String key) {
    return _sharedPrefsService.getToggleState(key);
  }

  /// removes all saved data in local storage [SharedPrefsRepository]
  Future<void> clearCache() async {
    await _sharedPrefsService.clearCache();

    if (kDebugMode) {
      print('Cache cleared');
    }
  }
}
