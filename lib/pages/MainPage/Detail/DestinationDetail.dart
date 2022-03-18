import 'package:flutter/material.dart';

import '../../../assets/images.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimension.dart';
import '../../../constants/typography.dart';
import '../../Models/DestinationModel.dart';

class DestinationDetail extends StatelessWidget {
  final DestinationModel destination;

  const DestinationDetail({Key? key, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topWidget() {
      return Container(
        child: Image.network(destination.imageContent),
      );
    }

    Widget cardWidget() {
      return Container(
        height: 370,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(d16),
              topRight: Radius.circular(d16),
            )),
        child: Padding(
          padding: const EdgeInsets.all(d24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    star,
                    width: d16,
                    height: d16,
                  ),
                  SizedBox(
                    width: d5,
                  ),
                  Text(
                    destination.rating,
                    style: medium.copyWith(color: gray),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    destination.destinationName,
                    style: bold.copyWith(color: black, fontSize: d20),
                  ),
                  Text(
                    "Rp. " + destination.price,
                    style: bold.copyWith(color: primary, fontSize: d20),
                  )
                ],
              ),
              SizedBox(
                height: d10,
              ),
              Row(
                children: [
                  Image.asset(
                    pin2,
                    width: d16,
                    height: d16,
                  ),
                  SizedBox(
                    width: d10,
                  ),
                  Text(
                    destination.subCountry,
                    style: regular.copyWith(color: primary),
                  )
                ],
              ),
              SizedBox(
                height: d10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About " + destination.destinationName,
                    style: medium.copyWith(color: black, fontSize: d16),
                  ),
                  SizedBox(
                    height: d5,
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    strutStyle: StrutStyle(fontSize: d10),
                    text: TextSpan(
                        style: extraLight.copyWith(color: gray),
                        text: destination.desc),
                  )
                ],
              ),
              SizedBox(
                height: d10,
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        visitors,
                        width: 38,
                        height: 38,
                      ),
                      SizedBox(
                        width: d10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Visitors",
                            style: bold.copyWith(color: black),
                          ),
                          Text(
                            "Max " + destination.visitor,
                            style: regular.copyWith(color: gray),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: d20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: orange, borderRadius: BorderRadius.circular(d10)),
                  child: Padding(
                    padding: const EdgeInsets.all(d16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book Now",
                          style: medium.copyWith(
                              color: Colors.white, fontSize: d16),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Stack(
          children: [
            topWidget(),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 50),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    back,
                    width: d33,
                    height: d33,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: cardWidget(),
            )
          ],
        ),
      ),
    );
  }
}
