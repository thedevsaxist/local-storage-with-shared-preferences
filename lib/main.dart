import 'barrel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize hive
  await Hive.initFlutter();
  await Hive.openBox('user_data');

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
