import 'dart:async';

import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacementNamed(PageRoutesName.signIn);
    // });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Assets.images.appLogo.image(width: mediaQuery.size.width * 0.5),
      ),
    );
  }
}
