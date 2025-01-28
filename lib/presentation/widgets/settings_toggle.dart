import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsToggle extends StatefulWidget {
  final String title;

  const SettingsToggle({
    super.key,
    required this.title,
  });

  @override
  State<SettingsToggle> createState() => _SettingsToggleState();
}

class _SettingsToggleState extends State<SettingsToggle> {
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: CupertinoSwitch(
        value: isToggled,
        onChanged: (_) {
          setState(() {
            isToggled = !isToggled;
          });
        },
      ),
    );
  }
}
