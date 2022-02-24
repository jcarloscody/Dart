// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
              image: "assets/images/image_1.png",
              country: "Brasil",
              price: 500,
              title: "Samantha",
              press: () {}),
          RecomendPlantCard(
              image: "assets/images/image_2.png",
              country: "Russia",
              price: 500,
              title: "Calabresa",
              press: () {}),
          RecomendPlantCard(
              image: "assets/images/image_3.png",
              country: "USA",
              price: 500,
              title: "Chicugunha",
              press: () {}),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  final String image, title, country;
  final int price;
  final Function press;

  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //it will cover 40% porcento of our total width
      width: size.width * 0.4,
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: () {
              press();
            },
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  )
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$$price",
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: kPrimaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
