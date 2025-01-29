import 'package:flutter/material.dart';

class RadioSelector extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const RadioSelector({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(value.toString()),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
