import 'package:flutter/material.dart';

import 'core/themes.dart';
import 'presentation/screens/settings_ui.dart';

void main() {
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
