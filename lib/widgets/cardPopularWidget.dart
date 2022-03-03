import 'package:flutter/material.dart';

import '../assets/images.dart';
import '../constants/colors.dart';
import '../constants/dimension.dart';
import '../constants/typography.dart';

class CardPopularWidget extends StatelessWidget {
  const CardPopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 212,
      child: Stack(
        children: [
          Image.asset(example),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(d10),
              child: Container(
                width: d33,
                height: d33,
                padding: EdgeInsets.all(d5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100),)
                ),
                child: Image.asset(love2),
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
                    borderRadius:
                    BorderRadius.all(Radius.circular(d10))),
                child: Padding(
                  padding: EdgeInsets.all(d10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bali",
                            style: bold.copyWith(fontSize: d16),
                          ),
                          Text(
                            "Rp. 170K",
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
                            "4.5 ratings",
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
                            "Osenia, America",
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