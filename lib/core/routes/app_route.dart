import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/modules/authentication/pages/forget_password_view.dart';
import 'package:event_app_c16_sat/modules/authentication/pages/sign_in_view.dart';
import 'package:event_app_c16_sat/modules/authentication/pages/sign_up_view.dart';
import 'package:event_app_c16_sat/modules/create_event/pages/create_event_view.dart';
import 'package:event_app_c16_sat/modules/layout/layout_view.dart';
import 'package:event_app_c16_sat/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PageRoutesName.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInView(),
          settings: settings,
        );

      case PageRoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
          settings: settings,
        );

      case PageRoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordView(),
          settings: settings,
        );

      case PageRoutesName.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );

      case PageRoutesName.createEvent:
        return MaterialPageRoute(
          builder: (context) => const CreateEventView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
