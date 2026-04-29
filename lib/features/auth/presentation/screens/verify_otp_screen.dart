import 'dart:async';

import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/features/auth/data/models/OtpParams.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/center_indicator.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../../shares/presentations/screen/main_nav_holder_screen.dart';
import '../../../../shares/presentations/widgets/show_snakbar_Message.dart';
import '../provider/verify_otp_provider.dart';
import '../widgets/resend_otp_section.dart';

class VerifyOtpScreen extends StatefulWidget {
  VerifyOtpScreen({super.key, required this.email});
  static const String name = '/forgetPasswordOtp';
  final String email;
  @override
  State<VerifyOtpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<VerifyOtpScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final PinInputController _otpController = PinInputController();
  final VerifyOtpProvider _otpProvider = VerifyOtpProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _otpProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _globalKey,
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

                    MaterialPinField(
                        pinController: _otpController,
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

                    const SizedBox(height: 18),

                    const SizedBox(height: 16),
                    Consumer<VerifyOtpProvider>(
                      builder: (context,_,_) {
                        if (_otpProvider.isotpProgress) {
                          return CenterIndicator();
                        }
                        return FilledButton(
                          onPressed: tapVerifyButton,
                          child: Text('Verify'),
                        );
                      }
                    ),

                    const SizedBox(height: 16),

                    ResendOtpSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void tapVerifyButton() {
    if (_otpController.text.length == 4) {
      VerifyOTP();
    }
  }

  Future<void> VerifyOTP() async {
    Otpparams otpparams = Otpparams(
      email: widget.email,
      otP: _otpController.text,
    );
    final bool isSuccess = await _otpProvider.OTp(otpparams);
    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavHolderScreen.name,
        (predicate) => false,
      );
    } else {
      SnakBarMessage(context, _otpProvider.errorMessage!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpController.dispose();
  }
}
