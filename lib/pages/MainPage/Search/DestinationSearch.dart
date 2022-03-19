import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_nusantara/assets/string.dart';
import 'package:travel_nusantara/constants/colors.dart';
import 'package:travel_nusantara/constants/typography.dart';
import 'package:travel_nusantara/pages/Data/DestinationData.dart';
import 'package:travel_nusantara/pages/Models/DestinationModel.dart';
import 'package:travel_nusantara/widgets/recommendedCardWidget.dart';

import '../../../assets/images.dart';
import '../../../constants/dimension.dart';

class DestinationSearch extends StatefulWidget {
  const DestinationSearch({Key? key}) : super(key: key);

  @override
  State<DestinationSearch> createState() => _DestinationSearchState();
}

class _DestinationSearchState extends State<DestinationSearch> {
  TextEditingController searchController = TextEditingController(text: "");
  late List<DestinationModel> data = [];

  searchData() {
    setState(() {
      setState(() {
        data = destinationData
            .where(
              (element) => element.destinationName.toLowerCase().contains(
                    searchController.text.toLowerCase(),
                  ),
            )
            .toList();
        log(searchController.text);
        log(data.length.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: Text(
          appName,
          style: bold.copyWith(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: d5, horizontal: d10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(d10)),
            child: TextFormField(
              controller: searchController,
              onChanged: (text) => searchData(),
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(d2),
                    child: Image.asset(
                      search,
                      width: d10,
                      height: d10,
                    ),
                  ),
                  hintText: "Try to find Raja Ampat",
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: d16,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: d10, vertical: d5),
            child: data.isEmpty
                ? Center(
                    child: Image.asset(found),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      late DestinationModel destination = data[index];
                      return Column(
                        children: [
                          RecommendedCardWidget(
                              placeName: destination.destinationName,
                              price: destination.price,
                              sumStar: destination.rating,
                              location: destination.subCountry,
                              imageMini: destination.imageMini,
                              destination: destination),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: d10,
                      );
                    },
                    itemCount: data.length),
          )
        ],
      ),
    );
  }
}
