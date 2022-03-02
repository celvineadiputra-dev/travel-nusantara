import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/typography.dart';
import 'package:travel_nusantara/pages/OnBoardingScreenPage.dart';

import '../assets/string.dart';
import '../constants/dimension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnBoardingScreenPage(),
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 176,
              height: 133,
            )
          ],
        ),
      ),
    );
  }
}
