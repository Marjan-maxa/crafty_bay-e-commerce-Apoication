import 'dart:async';

import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';

import 'package:crafty_bay/features/auth/presentation/widgets/logo_widget.dart';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../widgets/resend_otp_section.dart';

class ForgetPasswordOtpScreen extends StatefulWidget {
  ForgetPasswordOtpScreen({super.key});
  static const String name = '/forgetPasswordOtp';

  @override
  State<ForgetPasswordOtpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<ForgetPasswordOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                logo_app(width: 110, height: 110),
                const SizedBox(height: 16),
                Text(
                  context.l10n.fogetPasswordOtp,
                  style: context.textTheme.titleLarge,
                ),
                Text(
                  context.l10n.fogetPasswordOtpDetails,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 18),
                MaterialPinField(
                  theme: MaterialPinTheme(
                    // Shape
                    shape: MaterialPinShape.outlined,

                    spacing: 8,
                    borderRadius: BorderRadius.circular(12),

                    // Border
                    borderWidth: 1.5,
                    focusedBorderWidth: 2.0,
                    borderColor: Colors.grey,
                    focusedBorderColor: Colors.teal,
                    filledBorderColor: AppColor.themeColor,
                    errorColor: Colors.red,
                    completeFillColor: Colors.transparent,
                    completeBorderColor: AppColor.themeColor,

                    // Fill
                    fillColor: Colors.grey[100],
                    focusedFillColor: Colors.blue[50],
                    filledFillColor: Colors.white,

                    // Text
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textGradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),

                    // Cursor
                    showCursor: true,
                    cursorColor: Colors.blue,
                    cursorWidth: 2,
                    animateCursor: true,

                    // Animation
                    entryAnimation: MaterialPinAnimation.scale,
                    animationDuration: Duration(milliseconds: 150),
                    animationCurve: Curves.easeOut,

                    // Error
                    enableErrorShake: true,
                    errorAnimationDuration: Duration(milliseconds: 500),
                  ),
                  length: 4,
                  keyboardType: TextInputType.number,

                  onCompleted: (pin) => print('PIN: $pin'),
                  onChanged: (value) => print('Changed: $value'),
                ),

                const SizedBox(height: 16),
                FilledButton(onPressed: () {}, child: Text('Verify')),

                const SizedBox(height: 16),

                ResendOtpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}






