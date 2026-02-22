import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget widget;
    switch (settings.name) {
      case SplashScreen.name:
         widget=SplashScreen();
         break;
      case  SignUpScreen.name:
        widget=SignUpScreen();
        break;
      default:
        widget = SplashScreen();
    }

    return MaterialPageRoute(builder: (context)=>widget
    );
  }
}