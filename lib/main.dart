import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nota_app/models/note_model.dart';
import 'package:nota_app/views/home_view.dart';
import 'package:nota_app/views/onboarding_view.dart';
import 'package:nota_app/views/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('noting_box');
  runApp(const MyApp());

  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => HomeView(),
        'splash': (context) => const SplashView(),
        'onboarding': (context) => const OnboardingView()
      },
      theme: ThemeData(
        primaryColor: const Color(0xFF26C0EB),
        primaryColorDark: const Color(0xFF003E4F),
        canvasColor: Colors.white,
        hintColor: const Color(0xFF1E1E1E),
      ),
      home: const SplashView(),
    );
  }
}
