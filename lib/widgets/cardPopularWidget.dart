import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_nusantara/pages/MainPage/Detail/DestinationDetail.dart';
import 'package:travel_nusantara/pages/Models/DestinationModel.dart';

import '../assets/images.dart';
import '../constants/colors.dart';
import '../constants/dimension.dart';
import '../constants/typography.dart';

class CardPopularWidget extends StatefulWidget {
  final String imageCard, destinationName, price, rating, subCountry;
  final DestinationModel destination;

  const CardPopularWidget(
      {Key? key,
      required this.imageCard,
      required this.destinationName,
      required this.price,
      required this.rating,
      required this.subCountry,
      required this.destination})
      : super(key: key);

  @override
  State<CardPopularWidget> createState() => _CardPopularWidgetState();
}

class _CardPopularWidgetState extends State<CardPopularWidget> {
  late bool isLove = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 212,
      child: Stack(
        children: [
          Image.network(
            widget.imageCard,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(d10),
              child: Container(
                width: d33,
                height: d33,
                padding: EdgeInsets.all(d5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    )),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isLove = !isLove;
                    });
                  },
                  child: Image.asset(
                      isLove || widget.destination.isLove ? likeActive : like),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(d10),
              child: Container(
                height: 140,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(d10))),
                child: Padding(
                  padding: EdgeInsets.all(d10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.destinationName,
                            style: bold.copyWith(fontSize: d16),
                          ),
                          Text(
                            this.widget.price,
                            style: bold.copyWith(fontSize: d16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: d5,
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
                            '${widget.rating} ratings',
                            style: regular.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: d5,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            pin2,
                            width: d16,
                            height: d16,
                          ),
                          const SizedBox(
                            width: d5,
                          ),
                          Text(
                            widget.subCountry,
                            style: regular.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: d10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(d5),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DestinationDetail(
                                    destination: widget.destination,
                                  );
                                },
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: d10),
                                child: Text(
                                  "More detail",
                                  style: semiBoldPoppins.copyWith(
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
