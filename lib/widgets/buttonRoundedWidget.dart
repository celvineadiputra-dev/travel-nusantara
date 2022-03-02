import 'package:flutter/material.dart';
import 'package:travel_nusantara/constants/typography.dart';

import '../constants/dimension.dart';

class ButtonRoundedWidget extends StatelessWidget {
  final String label, to;
  final Color color;

  const ButtonRoundedWidget(
      {Key? key, required this.label, required this.to,required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, to);
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(d100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: d16),
          child: Text(
            label,
            style: bold.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
