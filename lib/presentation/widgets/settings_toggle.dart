import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_storage_demo/presentation/state/settings_toggle_view_model.dart';
import 'package:provider/provider.dart';

class SettingsToggle extends StatefulWidget {
  final String title;
  // final bool isToggled;
  // final void Function(bool)? onChanged;
  final String toggleKey;

  const SettingsToggle({
    super.key,
    required this.title,
    required this.toggleKey,
    // required this.isToggled,
    // this.onChanged,
  });

  @override
  State<SettingsToggle> createState() => _SettingsToggleState();
}

class _SettingsToggleState extends State<SettingsToggle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Consumer<SettingsToggleViewModel>(
        builder: (context, toggleState, child) {
          toggleState.getToggleState(widget.toggleKey);

          return CupertinoSwitch(
            value: toggleState.isToggled,
            onChanged: (state) {
              toggleState.saveToggleState(
                state: state,
                key: widget.toggleKey,
              );
            },
          );
        },
      ),
    );
  }
}
