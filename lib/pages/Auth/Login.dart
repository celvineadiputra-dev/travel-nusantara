import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/dimension.dart';
import 'package:travel_nusantara/widgets/InputWidget.dart';
import 'package:travel_nusantara/widgets/buttonRoundedWidget.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(d16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 176,
              height: 133,
            ),
            const SizedBox(
              height: d16,
            ),
            const InputWidget(label: "First Name",),
            const SizedBox(
              height: d10,
            ),
            const InputWidget(label: "Last Name",),
            const SizedBox(height: d16,),
            const ButtonRoundedWidget(label: "Login", to: '/home', isFull: true, padding: d5, fontSize: d24,)
          ],
        ),
      ),
    ));
  }
}
