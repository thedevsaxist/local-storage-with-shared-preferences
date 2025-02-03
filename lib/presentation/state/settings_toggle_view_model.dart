import 'package:flutter/material.dart';
import 'package:local_storage_demo/data/repositories/settings_toggle_repository.dart';

class SettingsToggleViewModel with ChangeNotifier {
  final SettingsToggleRepository _repository;

  SettingsToggleViewModel(this._repository);

  bool _isToggled = false;
  bool get isToggled => _isToggled;

  /// get the toggle state of the switch saved in local storage
  Future<void> getToggleState(String key) async {
    /// get the saved toggle state from local storage
    final toggleState = _repository.getToggleState(key);

    /// check if the [savedToggleState] has a value.
    /// If it does, assign that value to the [_isToggled] setter, and notify the listeners.
    if (toggleState != null) {
      _isToggled = toggleState;
    }
  }

  /// save the new toggle state of the switch to local storage
  Future<void> saveToggleState(
      {required bool state, required String key}) async {
    _isToggled = state;
    notifyListeners();
    await _repository.saveToggleState(key: key, state: state);
  }
}
