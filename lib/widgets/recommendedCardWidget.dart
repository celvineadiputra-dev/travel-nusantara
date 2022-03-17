import 'package:flutter/material.dart';

import '../assets/images.dart';
import '../constants/colors.dart';
import '../constants/dimension.dart';
import '../constants/typography.dart';

class RecommendedCardWidget extends StatelessWidget {
  final String placeName, price, sumStar, location;

  const RecommendedCardWidget(
      {Key? key,
      required this.placeName,
      required this.price,
      required this.sumStar,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(d10)),
      padding: const EdgeInsets.all(d10),
      child: Row(
        children: [
          Image.asset(
            illustration,
            width: 68,
            height: 68,
          ),
          const SizedBox(
            width: d10,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    placeName,
                    style: medium.copyWith(color: black),
                  ),
                  Text(
                    price,
                    style: medium.copyWith(color: black),
                  )
                ],
              ),
              const SizedBox(
                height: d10,
              ),
              Row(
                children: [
                  Image.asset(
                    star,
                    width: d16,
                    height: d16,
                  ),
                  const SizedBox(
                    width: d5,
                  ),
                  Text(
                    sumStar,
                    style: regular.copyWith(color: gray),
                  ),
                  const SizedBox(
                    width: d10,
                  ),
                  Image.asset(
                    pin2,
                    width: d16,
                    height: d16,
                  ),
                  const SizedBox(
                    width: d5,
                  ),
                  Text(
                    location,
                    style: regular.copyWith(color: gray),
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
