import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/localization_provider.dart';

class language_switcher extends StatelessWidget {
  const language_switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
        builder: (context,localizatioProvider,_) {
          return DropdownMenu(
            initialSelection: localizatioProvider.locale,
            dropdownMenuEntries: localizatioProvider.supportedLocal.map((l){
              return DropdownMenuEntry<Locale>(value: l, label: l.languageCode.toUpperCase());
            }).toList(),
            onSelected: (Locale? selectedLocal){
              localizatioProvider.changeLocale(selectedLocal!);
            },
          );
        }
    );
  }
}