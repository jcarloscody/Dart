// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lista_compras/components/description.dart';

class MainComponent extends StatelessWidget {
  final title;
  final description;

  const MainComponent(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text("img"),
            margin: EdgeInsets.fromLTRB(2, 15, 0, 0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            width: 100,
            height: 200,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 1, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Description(
                        description: this.description,
                        title: this.title,
                      ),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                      ),
                      width: 220,
                      height: 100,
                    ),
                    Container(
                      child: Text("Close"),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                      ),
                      width: 60,
                      height: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text("Increment"),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                      ),
                      width: 190,
                      height: 100,
                    ),
                    Container(
                      child: Text("Price"),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                      ),
                      width: 90,
                      height: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
