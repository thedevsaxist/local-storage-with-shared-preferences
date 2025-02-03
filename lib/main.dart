import 'package:flutter/material.dart';
import 'package:local_storage_demo/data/datasources/shared_prefs_service.dart';
import 'package:provider/provider.dart';

import 'core/themes.dart';

import 'data/repositories/settings_toggle_repository.dart';
import 'data/repositories/theme_mode_repository.dart';

import 'presentation/screens/settings_ui.dart';
import 'presentation/state/settings_toggle_view_model.dart';
import 'presentation/state/theme_mode_selector_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize shared preferences in the main function of the app.
  await SharedPrefsService().initPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsToggleViewModel(
            SettingsToggleRepository(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeModeSelectorViewModel(
            ThemeModeRepository(),
          ),
        ),
      ],
      child: const LocalStorageDemo(),
    ),
  );
}

class LocalStorageDemo extends StatefulWidget {
  const LocalStorageDemo({super.key});

  @override
  State<LocalStorageDemo> createState() => _LocalStorageDemoState();
}

class _LocalStorageDemoState extends State<LocalStorageDemo> {
  @override
  void initState() {
    super.initState();

    final themeModeViewModel =
        Provider.of<ThemeModeSelectorViewModel>(context, listen: false);
    themeModeViewModel.getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = context.watch<ThemeModeSelectorViewModel>().themeMode;

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
