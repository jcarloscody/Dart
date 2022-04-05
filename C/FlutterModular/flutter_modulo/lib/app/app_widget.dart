import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//aqui neste widget vc vai colocar as coisas iniciais como o MaterialApp
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
