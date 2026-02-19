import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name='/splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   moveToNextScreen();
    super.initState();
  }

  Future<void>moveToNextScreen()async {
   await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignUpScreen.name );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: logo_app()),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}


