import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension ApplocalizationsExtentions on BuildContext{
  AppLocalizations get   l10n{
   return AppLocalizations.of(this)!;
  }
}