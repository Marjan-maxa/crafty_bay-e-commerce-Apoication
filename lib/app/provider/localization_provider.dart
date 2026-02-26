import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  String _localKey='locale';
  Locale _locale = Locale('en');
  Locale get locale => _locale;
   List<Locale> get supportedLocal =>AppLocalizations.supportedLocales;
  void changeLocale(Locale newLocale) {
    _locale = newLocale;
    _saveLocale();
    notifyListeners();
  }

  Future<void>_saveLocale()async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_localKey, _locale.languageCode);
  }
  Future<void>loadLocale()async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     String? saveLocal =sharedPreferences.getString(_localKey);
    if(saveLocal!=null){
      _locale=Locale(saveLocal);
    }
  }
}
