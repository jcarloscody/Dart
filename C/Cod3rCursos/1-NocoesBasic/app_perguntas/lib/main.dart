import 'package:flutter/material.dart';

main() {
  runApp(PerguntApp());
}

class PerguntApp extends StatelessWidget {
  const PerguntApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text(
        "ola",
      ),
    );
  }
}
