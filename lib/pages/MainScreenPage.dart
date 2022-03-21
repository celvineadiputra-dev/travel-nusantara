import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/pages/MainPage/HomePage.dart';
import 'package:travel_nusantara/pages/MainPage/LovePage.dart';
import 'package:travel_nusantara/pages/MainPage/ProfilePage.dart';

import '../constants/dimension.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget bodyScreen() {
      switch (_currentIndex) {
        case 0 :
          return const HomePage();
        case 1 :
          return const LovePage();
        case 2 :
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: bodyScreen(),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
                icon: _currentIndex == 0
                    ? Image.asset(
                  homeActive,
                  width: d24,
                  height: d24,
                )
                    : Image.asset(
                  home,
                  width: d24,
                  height: d24,
                ),
                title: const Text("Home"),
                selectedColor: primary),
            SalomonBottomBarItem(
                icon: _currentIndex == 1
                    ? Image.asset(
                  loveActive,
                  width: d24,
                  height: d24,
                )
                    : Image.asset(
                  love,
                  width: d24,
                  height: d24,
                ),
                title: const Text("Love"),
                selectedColor: red),
            SalomonBottomBarItem(
                icon: _currentIndex == 2
                    ? Image.asset(
                  profileActive,
                  width: d24,
                  height: d24,
                )
                    : Image.asset(
                  profile,
                  width: d24,
                  height: d24,
                ),
                title: const Text("Profile"),
                selectedColor: orange)
          ],
        ),
      ),
    );
  }
}
