import 'package:flutter/material.dart';

class LovePage extends StatefulWidget {
  const LovePage({Key? key}) : super(key: key);

  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Love"),
      ),
    );
  }
}
