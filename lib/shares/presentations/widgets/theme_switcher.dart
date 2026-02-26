import 'package:crafty_bay/app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/localization_provider.dart';

class Theme_switcher extends StatelessWidget {
  const Theme_switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context,themeProvider,_) {
          return DropdownMenu(
            initialSelection: themeProvider.themeMode,
            dropdownMenuEntries: themeProvider.themeModes.map((l){
              return DropdownMenuEntry<ThemeMode>(
                  value: l,
                  label: l.name .toUpperCase());
            }).toList(),
            onSelected: (ThemeMode? selectedThemeMode){
              themeProvider.changeThemeMode(selectedThemeMode!);
            },
          );
        }
    );
  }
}