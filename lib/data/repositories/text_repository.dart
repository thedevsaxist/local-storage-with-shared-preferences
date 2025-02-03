import 'package:local_storage_demo/data/datasources/shared_prefs_service.dart';

/// This is a repository of the local storage [SharedPrefsService]
class TextRepository {
  final SharedPrefsService _sharedPrefsService = SharedPrefsService();

  /// Saves the user's details to local storage [TextRepository]
  Future<void> saveDetails({required String key, required String value}) {
    return _sharedPrefsService.saveDetails(
      key,
      value,
    );
  }

  /// retrieves the user's details from local storage [TextRepository]
  String? getDetails(String key) {
    return _sharedPrefsService.getDetails(key);
  }
}
