import 'package:crafty_bay/app/provider/localization_provider.dart';
import 'package:crafty_bay/app/routes.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


import '../l10n/app_localizations.dart';
import 'app_theme.dart';


class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LocalizationProvider())
      ],
      child: Consumer<LocalizationProvider>(
        builder: (context,localizationProvider,child) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: localizationProvider.supportedLocal,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.name,
            onGenerateRoute: Routes.onGenerateRoute,
            locale: localizationProvider.locale,
            // builder: (context, child) {
            //
            //   final locale = Localizations.localeOf(context);
            //   return Directionality(
            //     textDirection: locale.languageCode == 'ar'
            //         ? TextDirection.rtl
            //         : TextDirection.ltr,
            //     child: child!,
            //   );
            // },
          );
        }
      ),
    );
  }
}
