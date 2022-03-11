import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;
  const Questao({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
