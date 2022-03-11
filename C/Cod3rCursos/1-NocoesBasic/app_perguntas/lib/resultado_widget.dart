import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget {
  final nota;
  final VoidCallback reiniciar;
  const ResultadoWidget({Key? key, required this.nota, required this.reiniciar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text("Nota: $nota"),
        ElevatedButton(onPressed: reiniciar, child: const Text("Reiniciar"))
      ],
    ));
  }
}
