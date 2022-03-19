import 'package:flutter/material.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/typography.dart';

import '../constants/dimension.dart';

class ButtonRoundedWidget extends StatelessWidget {
  final String label, to;
  final Color color;
  final bool isFull;
  final double padding;
  final double fontSize;

  const ButtonRoundedWidget(
      {Key? key,
      required this.label,
      required this.to,
      this.color = primary,
      this.isFull = false,
      this.padding = 0,
      this.fontSize = d16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, to);
      },
      child: Container(
        width: isFull ? double.infinity : 150,
        padding: EdgeInsets.symmetric(vertical: padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(d10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: d16),
          child: Text(
            label,
            style: bold.copyWith(color: Colors.white, fontSize: fontSize),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
