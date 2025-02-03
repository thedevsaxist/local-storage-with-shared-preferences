import 'barrel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initHive();

  // initialize shared preferences in the main function of the app.
  await SharedPrefsService().initPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsUiViewModel(),
        ),
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
