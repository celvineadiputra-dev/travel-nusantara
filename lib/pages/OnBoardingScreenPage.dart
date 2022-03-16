import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/typography.dart';
import 'package:travel_nusantara/widgets/buttonRoundedWidget.dart';

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
              height: 378,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(d24),
                  topRight: Radius.circular(d24),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: d38, horizontal: d40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Start your journey",
                      style: bold.copyWith(fontSize: d48, color: black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: d24,
                    ),
                    Text(
                      "Join and carve out the goodness of your vacation trip with us",
                      style: regular.copyWith(fontSize: d16, color: gray),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: d40,
                    ),
                    const ButtonRoundedWidget(
                        label: "Get Started", to: '/login')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
