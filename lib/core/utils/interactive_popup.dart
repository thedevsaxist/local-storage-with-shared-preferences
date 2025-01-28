import 'package:flutter/material.dart';

void showInteractiveDialog(BuildContext context, Widget child) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: child,
      );
    },
  );
}
