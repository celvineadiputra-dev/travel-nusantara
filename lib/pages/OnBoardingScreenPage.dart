import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_nusantara/assets/images.dart';

import '../constants/dimension.dart';

class OnBoardingScreenPage extends StatelessWidget {
  const OnBoardingScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(temple), fit: BoxFit.fitWidth),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(d24),
                  topRight: Radius.circular(d24),
                ),
              ),
              child: Padding(
                child: Column(
                  children: [Text("HELLO")],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
