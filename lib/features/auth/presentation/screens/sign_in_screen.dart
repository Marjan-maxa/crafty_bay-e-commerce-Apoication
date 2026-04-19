import 'package:crafty_bay/features/auth/presentation/screens/forget_password_email_verified_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/logo_widget.dart';
import 'package:crafty_bay/shares/presentations/widgets/validetors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_color.dart';
import '../../../../app/extentions/applocalizations_extentions.dart';
import '../../../../shares/presentations/screen/main_nav_holder_screen.dart';
import '../../../../shares/presentations/widgets/show_snakbar_Message.dart';
import '../../data/models/signin_params.dart';
import '../provider/signin_provider.dart';
import '../widgets/center_indicator.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});
  static const String name = '/SignIn';

  @override
  State<SignInScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final SignInProvider _signInProvider = SignInProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signInProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    logo_app(width: 110, height: 110),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n.signIn,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      context.l10n.signInDetails,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 18),

                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColor.themeColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColor.themeColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColor.themeColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value)=>Validetors().validateEmail(value),
                    ),
                    const SizedBox(height: 18),

                    TextFormField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColor.themeColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColor.themeColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColor.themeColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value)=>Validetors().Validpassword(value),
                    ),
                    const SizedBox(height: 16),
                    Consumer<SignInProvider>(
                      builder: (context, _, _) {
                        if (_signInProvider.signInProgress) {
                          return CenterIndicator();
                        }
                        return FilledButton(
                          onPressed: _onTapSignButton,
                          child: Text('Login'),
                        );
                      },
                    ),

                    TextButton(
                      onPressed: _onTapForgetPasswordButton,
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/SignUp');
                          },
                          child: Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignButton() {
    _signIn();
  }

  Future<void> _signIn() async {
    if (_formkey.currentState!.validate()) {
      SigninParams params = SigninParams(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      final bool isSuccess = await _signInProvider.SignIn(params);
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainNavHolderScreen.name,
          (predicate) => false,
        );
      } else {
        SnakBarMessage(context, _signInProvider.errorMessage);
      }
    }
  }

  void _onTapForgetPasswordButton() {
    Navigator.pushNamed(context, ForgetPasswordEmailVerified.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
