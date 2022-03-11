import 'package:app_perguntas/questao.dart';
import 'package:app_perguntas/resposta.dart';
import 'package:flutter/material.dart';

class QuestionarioWidget extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final perguntaSelecionada;
  final Function responder;
  const QuestionarioWidget(
      {Key? key,
      required this.responder,
      required this.perguntas,
      required this.perguntaSelecionada})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]["texto"] as String),
        ...(perguntas[perguntaSelecionada]["respostas"] as List)
            .map((v) => RespostaWidget(
                responder: () {
                  responder(v["pontuacao"]);
                },
                texto: v["resposta"]))
      ],
    );
  }
}
