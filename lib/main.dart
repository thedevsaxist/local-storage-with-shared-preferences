import 'package:flutter/material.dart';
import 'package:local_storage_demo/data/datasources/shared_prefs_service.dart';
import 'package:provider/provider.dart';

import 'core/themes.dart';
import 'data/repositories/shared_prefs_repository.dart';
import 'presentation/screens/settings_ui.dart';
import 'presentation/state/settings_toggle_view_model.dart';
import 'presentation/state/theme_mode_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize shared preferences in the main function of the app.
  await SharedPrefsService().initPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsToggleViewModel(
            SharedPrefsRepository(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeModeSelector(),
        ),
      ],
      child: const LocalStorageDemo(),
    ),
  );
}

class LocalStorageDemo extends StatelessWidget {
  const LocalStorageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = context.watch<ThemeModeSelector>().themeMode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const SettingsUi(),
      themeMode: themeMode,
      darkTheme: darkTheme,
    );
  }
}
