
import 'screens_barrel.dart';

class SettingsUi extends StatefulWidget {
  const SettingsUi({super.key});

  @override
  State<SettingsUi> createState() => _SettingsUiState();
}

class _SettingsUiState extends State<SettingsUi> {
  @override
  void initState() {
    super.initState();

    Provider.of<SettingsUiViewModel>(context, listen: false)
        .initThemeMode(context);

    Provider.of<SettingsUiViewModel>(context, listen: false).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    String? groupValue =
        Provider.of<ThemeModeSelectorViewModel>(context).themeName;

    final settingsUiViewModel =
        Provider.of<SettingsUiViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const Divider(
            thickness: 1,
          ),

          // name
          SettingsTile(
            title: 'Name',
            trailing: settingsUiViewModel.user?.name ?? '',
            onTap: () {
              showInteractiveDialog(
                context,
                header: 'What is your name?',
                child: TextField(
                  controller: settingsUiViewModel.nameController,
                ),
              );
            },
          ),

          // username
          SettingsTile(
            title: 'Username',
            trailing: settingsUiViewModel.user?.userName ?? '',
            onTap: () {
              showInteractiveDialog(
                context,
                header: 'What should we call you?',
                child: TextField(
                  controller: settingsUiViewModel.usernameController,
                ),
              );
            },
          ),

          // birthday
          SettingsTile(
            title: 'Birthday',
            trailing: '06/01/2005',
            onTap: () {},
          ),

          // phone number
          SettingsTile(
            title: 'Phone Number',
            trailing: settingsUiViewModel.user?.phoneNumber ?? '',
            onTap: () {
              showInteractiveDialog(
                context,
                header: 'Enter your phone number?',
                child: TextField(
                  controller: settingsUiViewModel.phoneNumberController,
                ),
              );
            },
          ),

          // email
          SettingsTile(
            title: 'Email',
            trailing: settingsUiViewModel.user?.email ?? '',
            onTap: () {
              showInteractiveDialog(
                context,
                header: 'Enter your email?',
                child: TextField(
                  controller: settingsUiViewModel.emailController,
                ),
              );
            },
          ),

          // language
          SettingsTile(
            title: 'Language',
            onTap: () {},
          ),

          // theme
          SettingsTile(
            title: 'App Appearance',
            onTap: () {
              showInteractiveDialog(
                context,
                header: 'Theme',
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Consumer<ThemeModeSelectorViewModel>(
                          builder: (context, themeMode, child) {
                            return RadioSelector(
                              value: 'System'.toLowerCase(),
                              groupValue: groupValue,
                              onChanged: (selected) {
                                setState(() {
                                  groupValue = selected;
                                  themeMode.saveThemeMode(ThemeMode.system);
                                });

                                this.setState(() {
                                  groupValue = selected;
                                });
                              },
                            );
                          },
                        ),
                        Consumer<ThemeModeSelectorViewModel>(
                          builder: (context, themeMode, child) {
                            return RadioSelector(
                              value: 'Dark'.toLowerCase(),
                              groupValue: groupValue,
                              onChanged: (selected) {
                                setState(() {
                                  groupValue = selected;
                                  themeMode.saveThemeMode(ThemeMode.dark);
                                });

                                this.setState(() {
                                  groupValue = selected;
                                });
                              },
                            );
                          },
                          // child:
                        ),
                        Consumer<ThemeModeSelectorViewModel>(
                          builder: (context, themeMode, child) {
                            return RadioSelector(
                              value: 'Light'.toLowerCase(),
                              groupValue: groupValue,
                              onChanged: (selected) {
                                setState(() {
                                  groupValue = selected;
                                  themeMode.saveThemeMode(ThemeMode.light);
                                });

                                this.setState(() {
                                  groupValue = selected;
                                });
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),

          // Activity Indicator
          SettingsToggle(
            title: 'Activity Indicator',
            toggleKey: settingsUiViewModel.activityIndicatorKey,
          ),

          // notification
          SettingsToggle(
            title: 'Notification',
            toggleKey: settingsUiViewModel.notificationKey,
          ),

          // clear local storage
          SettingsTile(
            title: 'Clear Cache',
            onTap: () async {
              await SharedPrefsRepository().clearCache();
              clearUserData();
            },
          ),

          ElevatedButton(
            onPressed: () {
              // setState(() {
              settingsUiViewModel.updateUserDetails();
              // });
            },
            child: const Text('Save Details'),
          ),
        ],
      ),
    );
  }
}
