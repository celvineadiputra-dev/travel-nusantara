import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_nusantara/assets/string.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/typography.dart';
import 'package:travel_nusantara/pages/Data/DestinationData.dart';
import 'package:travel_nusantara/pages/Models/DestinationModel.dart';
import 'package:travel_nusantara/widgets/recommendedCardWidget.dart';

import '../../constants/dimension.dart';

class LovePage extends StatefulWidget {
  const LovePage({Key? key}) : super(key: key);

  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  late bool _isLoading = true;
  late List<DestinationModel> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = destinationData
          .where((element) => element.isLove == true)
          .toList();
      _isLoading = false;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.only(top: d10),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  late DestinationModel destination = data[index];
                  return Column(
                    children: [
                      RecommendedCardWidget(
                          placeName: destination.destinationName,
                          price: destination.price,
                          sumStar: destination.rating,
                          location: destination.subCountry,
                          imageMini: destination.imageMini,
                          destination: destination)
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: d10,
                  );
                },
                itemCount: data.length),
      ),
    );
  }
}
