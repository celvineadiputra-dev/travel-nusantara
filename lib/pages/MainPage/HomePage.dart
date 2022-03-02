import 'package:flutter/material.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/typography.dart';

import '../../constants/colors.dart';
import '../../constants/dimension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                text: "Celvine",
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
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
        child: ListView(
          children: [
            topApp(),
            SizedBox(
              height: d16,
            ),
            popular()
          ],
        ),
      ),
    );
  }
}
