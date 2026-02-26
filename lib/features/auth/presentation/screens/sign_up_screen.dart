
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';

import 'package:crafty_bay/features/auth/presentation/widgets/logo_widget.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});
 static const String name='/SignUp';

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  final TextEditingController _emailController=TextEditingController();
  final  TextEditingController _firstNameController=TextEditingController();
  final  TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();
  final TextEditingController _cityController=TextEditingController();
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
                  Text(context.l10n.createYourAccount,style: context.textTheme.titleLarge,),
                  Text(context.l10n.getStartedWithDetails,style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey
                  )),
                  const SizedBox(height: 18,),
                  TextFormField(
                    controller: _emailController,
                    textInputAction:TextInputAction.next,
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
                  const SizedBox(height: 13,),
                  TextFormField(
                    controller: _firstNameController,
                    textInputAction:TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'First Name',
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
                  const SizedBox(height: 13,),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction:TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
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
                  const SizedBox(height: 13,),
                  TextFormField(
                    controller: _mobileController,
                    textInputAction:TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Mobile',
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
                  const SizedBox(height: 13,),
                  TextFormField(
                    controller: _cityController,
                    textInputAction:TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'City',
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
                  const SizedBox(height: 13,),
                  TextFormField(
                    controller: _passwordController,
                    textInputAction:TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
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
                      onPressed:_onTapsignUpButton, child: Text('Sign Up')
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(onPressed: _onTapSignInButton, child: Text('Sign In'))
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

  }
  void _onTapSignInButton(){
    Navigator.pushNamed(context, SignInScreen.name);

  }

  @override
  void dispose() {
   _emailController.dispose();
   _firstNameController.dispose();
   _lastNameController.dispose();
   _mobileController.dispose();
   _cityController.dispose();
   _passwordController.dispose();
    super.dispose();
  }
}

