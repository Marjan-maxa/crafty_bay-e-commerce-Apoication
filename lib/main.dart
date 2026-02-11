
import 'package:crafty_bay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/crafty_bay_app.dart';

// Firebase setUp 🆗
// Crashlytics set U0p
//Analytic set Up
// Localization set Up
// Architecture design
// Theming set Up


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CraftyBayApp());
}

