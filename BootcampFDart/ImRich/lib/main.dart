import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('I am Richhh!'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/jc.jpg"),
          ),
        ),
      ),
    ),
  );
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am Rich!'),
          backgroundColor: Colors.blueGrey[900],
        ),
      ),
    );
  }
}
*/
