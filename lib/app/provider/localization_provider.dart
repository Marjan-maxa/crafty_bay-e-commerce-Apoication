import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = Locale('en');
  Locale get locale => _locale;
   List<Locale> get supportedLocal =>AppLocalizations.supportedLocales;
  void changeLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
