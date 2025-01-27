import 'package:flutter/material.dart';

import 'core/themes.dart';

void main() {
  runApp(const LocalStorageDemo());
}

class LocalStorageDemo extends StatelessWidget {
  const LocalStorageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      // home: const LocalStorageDemo(title: 'Flutter Demo Home Page'),
    );
  }
}