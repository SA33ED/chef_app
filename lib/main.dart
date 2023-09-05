import 'package:chef_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChefApp());
}

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
    );
  }
}
