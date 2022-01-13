// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Card(
            child: Container(
              child: Text("CHART!"),
              width: double.infinity,
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              child: Text("LIST OF TX"),
            ),
          )
        ],
      ),
    );
  }
}
