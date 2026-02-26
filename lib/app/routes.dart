import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
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
      case SignInScreen.name:
        widget=SignInScreen();
        break;
      default:
        widget=SplashScreen();
        break;
    }

    return MaterialPageRoute(builder: (context)=>widget
    );
  }
}