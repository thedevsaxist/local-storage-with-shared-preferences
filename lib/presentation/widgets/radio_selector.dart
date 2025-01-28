import 'package:flutter/material.dart';

class RadioSelector extends StatefulWidget {
  final Object value;
  Object? groupValue;
  RadioSelector(this.groupValue, {super.key, required this.value});

  @override
  State<RadioSelector> createState() => _RadioSelectorState();
}

class _RadioSelectorState extends State<RadioSelector> {
  @override
  Widget build(BuildContext context) {

    return RadioListTile(
      title: Text(widget.value.toString()),
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: (selected) {
        // if (groupValue != null) {}
        setState(() {
          widget.groupValue = selected;
        });
      },
    );
  }
}
