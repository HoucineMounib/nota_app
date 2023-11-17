import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nota_app/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500),
        () => Navigator.of(context).pushReplacementNamed(
            //onboarding Filtrition
            initScreen == 0 || initScreen == null ? "onboarding" : 'home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset('assets/splash.png', fit: BoxFit.cover),
      ),
    );
  }
}
