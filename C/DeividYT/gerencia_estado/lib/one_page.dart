import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_button_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);
  //ValueNotifier >> é um gerenciador de estado que gera a possibilidade de fazer  a reconstrucao de um determinado bloco de codigo e esse bloco é onde ocorre normalmente a nossa volatilidade do codigo, onde o dado sofrera constante auteraçoes. dessa forma não recriamos toda a page

  random() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
     /* setState(() {
        valorAleatorio.value = Random().nextInt(1000);
      });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valorAleatorio,
              builder: (_, value, __) => Text("Valor $value"),
            ),
            CustomButtonWidget(
              onPressed: () => random(),
              state: false,
              title: "SHOW",
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
