import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:event_app_c16_sat/core/routes/app_route.dart';
import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/core/theme/app_theme_manager.dart';

import 'firebase_options.dart' show DefaultFirebaseOptions;

/// 1- Dark and Light Theme
/// 2- Localization (en, ar)
/// 3- State Management (Provider)
/// 4- Firebase [Firebase Auth, Firebase Firestore]

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

// void call() async {
//   print("Hello1");
//   await Future.delayed(Duration.zero, () {
//     print("Hello2");
//   });
//   print("Hello3");
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: PageRoutesName.layout,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
