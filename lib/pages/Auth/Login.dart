import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_nusantara/assets/images.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/dimension.dart';
import 'package:travel_nusantara/pages/Models/AuthModel.dart';
import 'package:travel_nusantara/widgets/InputWidget.dart';
import 'package:travel_nusantara/widgets/buttonRoundedCallbackWidget.dart';
import 'package:travel_nusantara/widgets/buttonRoundedWidget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputFirstNameController = TextEditingController(text: '');
    TextEditingController inputLastNameController = TextEditingController(text: '');

    saveData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      AuthModel user = AuthModel(firstName: inputFirstNameController.text, lastName: inputLastNameController.text);
      prefs.setString("auth_user", jsonEncode(user));
      developer.log(jsonEncode(user));
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
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
              InputWidget(label: "First Name", inputController: inputFirstNameController,),
              const SizedBox(
                height: d16,
              ),
              InputWidget(label: "Last Name", inputController: inputLastNameController,),
              const SizedBox(height: d16,),
              ButtonRoundedCallbackWidget(label: "Login", to: '/home', isFull: true, padding: d2, fontSize: d20, callback: saveData,),
            ],
          ),
      ),
    ),
        ));
  }
}
