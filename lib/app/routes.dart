import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/forget_password_email_verified_screen.dart';
import '../features/auth/presentation/screens/forget_password_otp_screen.dart';
import '../features/cart/presentation/screens/cart_item_screen.dart';
import '../features/catagory/presentation/screens/catagory_list_screen.dart';
import '../features/product/presentation/screeen/product_list.dart';
import '../features/product/presentation/screeen/product_review.dart';
import '../features/product/presentation/screeen/products_details.dart';
import '../shares/presentations/screen/main_nav_holder_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget widget;
    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
        break;
      case SignUpScreen.name:
        widget = SignUpScreen();
        break;
      case SignInScreen.name:
        widget = SignInScreen();
        break;
      case ForgetPasswordEmailVerified.name:
        widget = ForgetPasswordEmailVerified();
        break;
      case ForgetPasswordOtpScreen.name:
        widget = ForgetPasswordOtpScreen();
        break;
      case MainNavHolderScreen.name:
        widget = MainNavHolderScreen();
        break;
      case CatagoryListScreen.name:
        widget = CatagoryListScreen();
        break;
      case ProductList.name:
        final categories = settings.arguments as String;
        widget = ProductList(categories: categories);
        break;
      case CartItemScreen.name:
        final cartItem = settings.arguments as String;
        widget = CartItemScreen(cartItem: cartItem);
        break;
      case ProductsDetails.name:
        final Productdetails = settings.arguments as String;
        widget = ProductsDetails(Productdetails:Productdetails,);
        break;
      case ProductReview.name:
        widget = ProductReview();
        break;
      default:
        widget = SplashScreen();
        break;
    }

    return MaterialPageRoute(builder: (context) => widget);
  }
}
