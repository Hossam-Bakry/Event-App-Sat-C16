import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:event_app_c16_sat/core/services/loading_service.dart';
import 'package:event_app_c16_sat/modules/app_manager/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:event_app_c16_sat/core/routes/app_route.dart';
import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/core/theme/app_theme_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart' show DefaultFirebaseOptions;

/// 1- Dark and Light Theme
/// 2- Localization (en, ar)
/// 3- State Management (Provider)
/// 4- Firebase [Firebase Auth, Firebase Firestore]

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );

  configLoading();
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

    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      title: 'Event App',
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: provider.currentTheme,
      locale: Locale(provider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
