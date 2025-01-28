import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // create a static instance of the class [SharedPrefs], calling _internal() of _()

  static final SharedPrefs _instance = SharedPrefs._();

  // create an instance of shared preference
  SharedPreferences? _preferences;

  // create a factory of the class [SharedPrefs]
  factory SharedPrefs() => _instance;

  // call the instance value
  SharedPrefs._();

  // create a method to initialize the local storage
  Future<void> initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
