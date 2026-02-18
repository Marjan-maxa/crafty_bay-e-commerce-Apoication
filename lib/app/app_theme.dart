import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData _lightThemeData=ThemeData(
    colorSchemeSeed: AppColor.themeColor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme:_indicatorThemeData
  );
  static ThemeData _darkThemeData=ThemeData(
      colorSchemeSeed: AppColor.themeColor,
    brightness:Brightness.dark,
    progressIndicatorTheme: _indicatorThemeData
  );

  static ThemeData get lightTheme=>_lightThemeData;
  static ThemeData get darkTheme=>_darkThemeData;

  static ProgressIndicatorThemeData get _indicatorThemeData{
    return ProgressIndicatorThemeData(
      color: AppColor.themeColor
    );
  }

}
