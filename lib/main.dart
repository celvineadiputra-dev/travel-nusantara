import 'package:flutter/material.dart';
import 'package:travel_nusantara/pages/Auth/Login.dart';
import 'package:travel_nusantara/pages/MainScreenPage.dart';
import 'package:travel_nusantara/pages/OnBoardingScreenPage.dart';
import 'package:travel_nusantara/pages/SplashScreenPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const SplashScreen(),
        '/onboarding' : (context) => const OnBoardingScreenPage(),
        '/login' : (context) => const Login(),
        '/home' : (context) => const MainScreenPage()
      },
    );
  }
}
