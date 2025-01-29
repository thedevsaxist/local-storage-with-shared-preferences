import 'package:flutter/material.dart';

void showInteractiveDialog(BuildContext context,
    {required String header, required Widget child}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          header,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        contentPadding: const EdgeInsets.all(30.0),
        content: child,
      );
    },
  );
}
