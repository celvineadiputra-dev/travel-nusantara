import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/typography.dart';
import 'package:travel_nusantara/pages/Data/DestinationData.dart';
import 'package:travel_nusantara/pages/Models/AuthModel.dart';
import 'package:travel_nusantara/pages/Models/DestinationModel.dart';
import 'package:travel_nusantara/widgets/cardPopularWidget.dart';
import 'package:travel_nusantara/widgets/recommendedCardWidget.dart';

import '../../assets/string.dart';
import '../../constants/colors.dart';
import '../../constants/dimension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPrefs;
  late AuthModel? auth = AuthModel(firstName: "Loading", lastName: "Loading");

  @override
  initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        sharedPrefs = prefs;
      });
      String? n = sharedPrefs.getString('auth_user');
      auth = AuthModel.fromJson(jsonDecode(n!));
    });
  }

  Widget topApp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Hi, ",
            style: regularPoppins.copyWith(color: black),
            children: [
              TextSpan(
                text: auth?.firstName ?? "-",
                style: semiBoldPoppins.copyWith(color: black),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        SizedBox(
          width: 218,
          child: Text(
            "Where would you like to go ?",
            style: boldPoppins.copyWith(color: black, fontSize: 22),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Row(
          children: [
            Image.asset(
              pin,
              width: d16,
              height: d16,
            ),
            const SizedBox(
              width: d10,
            ),
            Text(
              "Palembang, Sumatera Selatan",
              style: extraLight.copyWith(color: gray),
            )
          ],
        ),
        const SizedBox(
          height: d16,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(d10)),
          child: TextFormField(
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(2),
                  child: Image.asset(
                    search,
                    width: d10,
                    height: d10,
                  ),
                ),
                hintText: "Try to find Palembang",
                border: InputBorder.none),
          ),
        )
      ],
    );
  }

  Widget popular() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Destination",
              style: bold.copyWith(fontSize: d18),
            ),
            Text(
              "Show All",
              style: medium.copyWith(fontSize: d16, color: primary),
            )
          ],
        ),
        const SizedBox(
          height: d24,
        ),
        SizedBox(
            height: 322,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: destinationPopularData.length,
                itemBuilder: (BuildContext context, int index) {
                  late DestinationModel destination =
                      destinationPopularData[index];
                  return Row(
                    children: [
                      CardPopularWidget(
                        imageCard: destination.imageCard,
                        destinationName: destination.destinationName,
                        price: destination.price,
                        rating: destination.rating,
                        subCountry: destination.subCountry,
                        destination: destination,
                      ),
                      const SizedBox(
                        width: d10,
                      ),
                    ],
                  );
                },
              ),
            ))
      ],
    );
  }

  Widget recommended() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: bold.copyWith(fontSize: d18),
              ),
              Text(
                "Show All",
                style: medium.copyWith(fontSize: d16, color: primary),
              ),
            ],
          ),
          const SizedBox(
            height: d16,
          ),
          SizedBox(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: destinationRecommendedData.length,
                itemBuilder: (BuildContext context, int index) {
                  late DestinationModel destination =
                      destinationRecommendedData[index];
                  return Column(
                    children: [
                      RecommendedCardWidget(
                        placeName: destination.destinationName,
                        price: destination.price,
                        sumStar: destination.rating,
                        location: destination.subCountry,
                        imageMini: destination.imageMini,
                        destination: destination,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
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
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: d16),
            child: Image.asset(
              notification,
              width: d24,
              height: d24,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: d16, vertical: d10),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: ListView(
            children: [
              topApp(),
              SizedBox(
                height: d16,
              ),
              popular(),
              SizedBox(
                height: d16,
              ),
              recommended()
            ],
          ),
        ),
      ),
    );
  }
}
