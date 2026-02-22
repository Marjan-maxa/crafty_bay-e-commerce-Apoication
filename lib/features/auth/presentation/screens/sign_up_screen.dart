
import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/app/provider/localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});
 static const String name='/SignUp';

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final localizatioProvider=context.read<LocalizationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          DropdownMenu(dropdownMenuEntries: localizatioProvider.supportedLocal.map((l){
            return DropdownMenuEntry<Locale>(value: l, label: l.languageCode);
          }).toList(),
            onSelected: (Locale? selectedLocal){
            localizatioProvider.changeLocale(selectedLocal!);
            },
          ),

        ],
      ),
    );
  }
}
  // 34:26 next start again video.............................