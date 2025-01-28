import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String? trailing;
  final void Function()? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Text(
        trailing ?? '',
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.grey),
      ),
      onTap: onTap,
    );
  }
}
