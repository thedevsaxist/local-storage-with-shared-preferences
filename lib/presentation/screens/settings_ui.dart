import 'package:flutter/material.dart';
import 'package:local_storage_demo/core/utils/interactive_popup.dart';
import 'package:local_storage_demo/data/repositories/shared_prefs_repository.dart';
import 'package:local_storage_demo/presentation/state/theme_mode_selector_view_model.dart';

import 'package:local_storage_demo/presentation/widgets/radio_selector.dart';
import 'package:local_storage_demo/presentation/widgets/settings_tile.dart';
import 'package:local_storage_demo/presentation/widgets/settings_toggle.dart';
import 'package:provider/provider.dart';

class SettingsUi extends StatefulWidget {
  const SettingsUi({super.key});

  @override
  State<SettingsUi> createState() => _SettingsUiState();
}

class _SettingsUiState extends State<SettingsUi> {
  String notificationKey = 'notification';
  String activityIndicatorKey = 'activity_indicator';

  @override
  void initState() {
    super.initState();

    final themeModeViewModel =
        Provider.of<ThemeModeSelectorViewModel>(context, listen: false);
    themeModeViewModel.getThemeName();
  }

  @override
  Widget build(BuildContext context) {
    String? groupValue =
        Provider.of<ThemeModeSelectorViewModel>(context).themeName;
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
            trailing: 'Chidiebube Iroezindu',
            onTap: () {
              showInteractiveDialog(
                context,
                header: 'What is your name?',
                child: const TextField(),
              );
            },
          ),

          // username
          SettingsTile(
            title: 'Username',
            trailing: 'thedevsaxist',
            onTap: () {},
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
            trailing: '+2347088391516',
            onTap: () {},
          ),

          // email
          SettingsTile(
            title: 'Email',
            trailing: 'chidiebubeiroezindu@gmail.com',
            onTap: () {},
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
            toggleKey: activityIndicatorKey,
          ),

          // notification
          SettingsToggle(
            title: 'Notification',
            toggleKey: notificationKey,
          ),

          // clear local storage
          SettingsTile(
            title: 'Clear Cache',
            onTap: () async {
              await SharedPrefsRepository().clearCache();
            },
          ),
        ],
      ),
    );
  }
}
