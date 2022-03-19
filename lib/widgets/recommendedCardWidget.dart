import 'package:flutter/material.dart';

import '../assets/images.dart';
import '../constants/colors.dart';
import '../constants/dimension.dart';
import '../constants/typography.dart';
import '../pages/MainPage/Detail/DestinationDetail.dart';
import '../pages/Models/DestinationModel.dart';

class RecommendedCardWidget extends StatelessWidget {
  final String placeName, price, sumStar, location, imageMini;
  final DestinationModel destination;

  const RecommendedCardWidget(
      {Key? key,
      required this.placeName,
      required this.price,
      required this.sumStar,
      required this.location,
      required this.imageMini,
      required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DestinationDetail(destination: destination,);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(d10)),
        child: ListTile(
          leading: Image.network(
            imageMini,
          ),
          title: Row(
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
          subtitle: Row(
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
                width: d5,
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
          ),
        )
      ),
    );
  }
}
