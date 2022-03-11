import 'package:flutter/material.dart';

class RespostaWidget extends StatelessWidget {
  VoidCallback responder;
  String texto;
  RespostaWidget({Key? key, required this.responder, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: responder,
        child: Text(texto),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
      ),
    );
  }
}
