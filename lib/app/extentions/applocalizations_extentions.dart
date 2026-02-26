import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension util_Extention on BuildContext{
  AppLocalizations get   l10n{
   return AppLocalizations.of(this)!;
  }

  TextTheme get textTheme=>TextTheme.of(this)!;
}