import 'package:crafty_bay/app/routes.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';


class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
