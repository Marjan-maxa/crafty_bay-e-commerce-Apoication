
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';

import 'package:crafty_bay/features/auth/presentation/widgets/logo_widget.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import 'forget_password_otp_screen.dart';

class ForgetPasswordEmailVerified extends StatefulWidget {
  ForgetPasswordEmailVerified({super.key});
  static const String name='/Email_verify';

  @override
  State<ForgetPasswordEmailVerified> createState() => _SignUpState();
}

class _SignUpState extends State<ForgetPasswordEmailVerified> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  logo_app(
                    width: 110,
                    height: 110,
                  ),
                  const SizedBox(height: 16,),
                  Text(context.l10n.forgetPasswordEmailVerified,style: context.textTheme.titleLarge,),
                  Text(context.l10n.forgetPasswordEmailVerifiedDetails,style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey
                  )),
                  const SizedBox(height: 18,),

                  TextFormField(
                    controller: _emailController,
                    textInputAction:TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColor.themeColor
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppColor.themeColor
                          ),

                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppColor.themeColor
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Colors.red
                            )
                        )
                    ),
                  ),
                  const SizedBox(height: 16,),
                  FilledButton(
                      onPressed:_onTapForgetPasswordNextButton, child: Text('Next')
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold)),
                      TextButton(onPressed:_onTapsignUpButton, child: Text('Sign Up'))
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapsignUpButton(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }
  void _onTapForgetPasswordNextButton(){
    Navigator.pushNamed(context, ForgetPasswordOtpScreen.name);
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

