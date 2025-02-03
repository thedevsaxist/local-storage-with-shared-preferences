import 'package:flutter/foundation.dart';
import 'package:local_storage_demo/data/datasources/shared_prefs_service.dart';

/// This is a repository of the local storage [SharedPrefsService]
class SharedPrefsRepository {
  final SharedPrefsService _sharedPrefsService = SharedPrefsService();

  /// removes all saved data in local storage [SharedPrefsRepository]
  Future<void> clearCache() async {
    await _sharedPrefsService.clearCache();

    if (kDebugMode) {
      print('Cache cleared');
    }
  }
}
