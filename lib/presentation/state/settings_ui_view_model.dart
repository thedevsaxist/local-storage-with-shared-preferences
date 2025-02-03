import 'package:flutter/material.dart';
import 'package:local_storage_demo/core/constants.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_data.dart';
import 'theme_mode_selector_view_model.dart';

class SettingsUiViewModel with ChangeNotifier {
  UserData? _user;
  UserData? get user => _user;

  final String _notificationKey = 'notification';
  final String _activityIndicatorKey = 'activity_indicator';

  String get notificationKey => _notificationKey;
  String get activityIndicatorKey => _activityIndicatorKey;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get birthdayController => _birthdayController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get phoneNumberController => _phoneNumberController;

  void initThemeMode(BuildContext context) {
    final themeModeViewModel =
        Provider.of<ThemeModeSelectorViewModel>(context, listen: false);
    themeModeViewModel.getThemeName();
  }

  void updateUserDetails() {
    if (_nameController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      final userDetails = UserData(
        name: _nameController.text,
        userName: _usernameController.text,
        birthDay: _birthdayController.text,
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text,
      );

      saveUserData(userDetails);
    }
  }

  void saveUserData(UserData userData) {
    userDataBox.put('user', userData);
    _user = userData;
    notifyListeners();
  }

  UserData? getUserData() {
    _user = userDataBox.get('user');
    return user;
  }
}
