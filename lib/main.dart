import 'package:flutter/material.dart';
import 'package:local_storage_demo/data/datasources/shared_prefs.dart';

import 'core/themes.dart';
import 'presentation/screens/settings_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize shared preferences in the main function of the app.
  final prefs = SharedPrefs();
  await prefs.initPrefs();

  runApp(const LocalStorageDemo());
}

class LocalStorageDemo extends StatelessWidget {
  const LocalStorageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const SettingsUi(),
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
    );
  }
}
