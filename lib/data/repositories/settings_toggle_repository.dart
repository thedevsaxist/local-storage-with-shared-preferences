import 'package:local_storage_demo/data/datasources/shared_prefs_service.dart';

/// This is a repository of the local storage [SharedPrefsService]
class SettingsToggleRepository {
  final SharedPrefsService _sharedPrefsService = SharedPrefsService();

  /// saves the last toggle state of the switch to local storage [SettingsToggleRepository]
  Future<void> saveToggleState({required String key, required bool state}) {
    return _sharedPrefsService.saveToggleState(key, state);
  }

  /// retrieves the last toggle state of the switch to local storage [SettingsToggleRepository]
  bool? getToggleState(String key) {
    return _sharedPrefsService.getToggleState(key);
  }
}
