import 'package:chef_app/core/theme/app_theme.dart';
import 'package:chef_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChefApp());
}

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: getAppTheme(),
    );
  }
}
