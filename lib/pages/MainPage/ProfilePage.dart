import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/typography.dart';
import 'package:travel_nusantara/pages/Models/AuthModel.dart';

import '../../constants/dimension.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences sharedPreferences;
  late AuthModel? auth = AuthModel(firstName: "Loading", lastName: "loading");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((value) {
      setState(() {
        sharedPreferences = value;
      });
      String? n = sharedPreferences.getString("auth_user");
      auth = AuthModel.fromJson(jsonDecode(n!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image(
                  fit: BoxFit.cover,
                  image: AssetImage(banner),
                ),
                Positioned(
                  bottom: -119,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://dookinet.sirv.com/travel_nusantara/profile.png?q=30'),
                      ),
                      SizedBox(
                        height: d10,
                      ),
                      Text(
                        auth?.fullName ?? "-",
                        style: bold.copyWith(color: black, fontSize: d24),
                      ),
                      Text(
                        "Basic member",
                        style: extraLight.copyWith(color: gray),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 140,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: d16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(d10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            premium,
                            width: 52,
                            height: 52,
                          ),
                          SizedBox(
                            width: d10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Upgrade Premium",
                                style:
                                    bold.copyWith(color: black, fontSize: d16),
                              ),
                              SizedBox(
                                height: d5,
                              ),
                              Text(
                                "Choose your plan",
                                style: regular.copyWith(color: gray),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: d16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(d10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            wallet,
                            width: 52,
                            height: 52,
                          ),
                          SizedBox(
                            width: d10,
                          ),
                          Text(
                            "Payment & Wallet",
                            style: bold.copyWith(color: black, fontSize: d16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: d24,
            ),
            Text(
              "Log out",
              style: bold.copyWith(color: red, fontSize: d18),
            )
          ],
        ),
      ),
    );
  }
}
