


import 'package:crafty_bay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/crafty_bay_app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// Firebase setUp 🆗
// Crashlytics set U0p 🆗
//Analytic set Up   🆗
// Localization set Up
// Architecture design - 🆗
// Theming set Up


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const CraftyBayApp());
}

