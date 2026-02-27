import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/forget_password_email_verified_screen.dart';
import '../features/auth/presentation/screens/forget_password_otp_screen.dart';

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
      case ForgetPasswordEmailVerified.name:
        widget=ForgetPasswordEmailVerified();
        break;
      case ForgetPasswordOtpScreen.name:
        widget=ForgetPasswordOtpScreen();
        break;
      default:
        widget=SplashScreen();
        break;
    }

    return MaterialPageRoute(builder: (context)=>widget
    );
  }
}