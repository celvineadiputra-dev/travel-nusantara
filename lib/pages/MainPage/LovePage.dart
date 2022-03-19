import 'package:flutter/material.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/assets/string.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/typography.dart';
import 'package:travel_nusantara/widgets/recommendedCardWidget.dart';

import '../../constants/dimension.dart';

class LovePage extends StatefulWidget {
  const LovePage({Key? key}) : super(key: key);

  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          appName,
          style: bold.copyWith(color: black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: d16, vertical: d16),
          child: Column(
            children: [
              // RecommendedCardWidget(
              //     placeName: "XBA",
              //     price: "RX",
              //     sumStar: "4.9",
              //     location: "Indonesia",
              //     imageMini: illustration,
              //     destination: [])
            ],
          ),
        ),
      ),
    );
  }
}
