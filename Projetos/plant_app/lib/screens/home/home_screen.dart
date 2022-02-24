// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/screens/home/components/body.dart';

import '../../components/my_button_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: null,
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
    );
  }
}
