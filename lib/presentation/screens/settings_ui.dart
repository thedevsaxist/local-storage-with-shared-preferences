import 'package:flutter/material.dart';
import 'package:local_storage_demo/core/utils/interactive_popup.dart';
import 'package:local_storage_demo/presentation/widgets/radio_selector.dart';
import 'package:local_storage_demo/presentation/widgets/settings_tile.dart';
import 'package:local_storage_demo/presentation/widgets/settings_toggle.dart';

class SettingsUi extends StatefulWidget {
  const SettingsUi({super.key});

  @override
  State<SettingsUi> createState() => _SettingsUiState();
}

class _SettingsUiState extends State<SettingsUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              // color: Colors.deepOrange.shade900,
              ),
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
                child: TextField(),
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
                child: Column(
                  children: [
                    RadioSelector(
                      'system',
                      value: 'System',
                    ),
                    RadioSelector(
                      'dark',
                      value: 'Dark',
                    ),
                    RadioSelector(
                      'light',
                      value: 'Light',
                    ),
                  ],
                ),
              );
            },
          ),

          // Activity Indicator
          const SettingsToggle(title: 'Activity Indicator'),

          // notifications
          const SettingsToggle(title: 'Notifications'),

          // clear local storage
          SettingsTile(
            title: 'Clear Cache',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
