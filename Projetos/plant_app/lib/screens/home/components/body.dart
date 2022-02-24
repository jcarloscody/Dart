// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/recomends_plants.dart';
import 'package:plant_app/screens/home/components/title_with_more_bbtn.dart';

import 'featured_plants.dart';
import 'header_with_searchbox.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //it will provie us total height and width of our screen
    Size size = MediaQuery.of(context).size;

    //it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recommend", pressMore: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Feature plantas", pressMore: () {}),
          FeaturedPlants(),
          SizedBox(
            height: kDefaultPadding,
          )
        ],
      ),
    );
  }
}
