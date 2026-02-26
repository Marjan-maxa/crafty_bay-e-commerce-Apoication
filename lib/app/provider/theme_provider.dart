import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
 final String _themeKey='theme';
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get themeMode => _mode;
  List<ThemeMode> get themeModes =>[
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system
  ];
  void changeThemeMode(ThemeMode newThemeMode) {
    _mode = newThemeMode;
    _saveThemeMode();
    notifyListeners();
  }

  Future<void>_saveThemeMode()async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_themeKey, _mode.name);
  }
  Future<void>loadThemeMode()async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? saveThememode =sharedPreferences.getString(_themeKey);
    if(saveThememode!=null){
      _mode=ThemeMode.values.firstWhere((mode)=>mode.name==saveThememode);
    }
  }
}
