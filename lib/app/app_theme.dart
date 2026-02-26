import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
      colorSchemeSeed: AppColor.themeColor,
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: _indicatorThemeData,
      textTheme: _textTheme,
      filledButtonTheme:_fillButtonTheme

  );
  static ThemeData _darkThemeData = ThemeData(
      colorSchemeSeed: AppColor.themeColor,
      brightness: Brightness.dark,
      progressIndicatorTheme: _indicatorThemeData,
      textTheme: _textTheme,
      filledButtonTheme:_fillButtonTheme
  );

  static ThemeData get lightTheme => _lightThemeData;

  static ThemeData get darkTheme => _darkThemeData;

  static ProgressIndicatorThemeData get _indicatorThemeData {
    return ProgressIndicatorThemeData(
        color: AppColor.themeColor
    );
  }

  static TextTheme get _textTheme =>
      TextTheme(
          titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          )
      );

  static FilledButtonThemeData get _fillButtonTheme =>
      FilledButtonThemeData(

        style: FilledButton.styleFrom(
            padding: EdgeInsetsGeometry.symmetric(vertical: 12),
            backgroundColor: AppColor.themeColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(8)
            ),
            fixedSize: Size.fromWidth(double.maxFinite)
        ),
      );

}
