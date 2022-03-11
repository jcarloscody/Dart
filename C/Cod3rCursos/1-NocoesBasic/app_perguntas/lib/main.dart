import 'package:app_perguntas/questao.dart';
import 'package:app_perguntas/questionario_widget.dart';
import 'package:app_perguntas/resposta.dart';
import 'package:app_perguntas/resultado_widget.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const PerguntApp());
}

class PerguntApp extends StatefulWidget {
  const PerguntApp({Key? key}) : super(key: key);

  @override
  State<PerguntApp> createState() => _PerguntAppState();
}

class _PerguntAppState extends State<PerguntApp> {
  int perguntaSelecionada = 0;
  bool fim = true;
  int acumuladorNotas = 0;
  responder(int perguntaSelec) {
    setState(() {
      if (perguntaSelecionada == perguntas.length - 1) {
        fim = false;
      }
      acumuladorNotas += perguntaSelec;
      perguntaSelecionada++;
    });
  }

  final List<Map<String, Object>> perguntas = [
    {
      "texto": "Qual o seu animal favorito?",
      "respostas": [
        {"resposta": "dog", "pontuacao": 10},
        {"resposta": "cat", "pontuacao": 5},
        {"resposta": "elefante", "pontuacao": 20},
      ]
    },
    {
      "texto": "Qual a sua cor favorita?",
      "respostas": [
        {"resposta": "preto", "pontuacao": 10},
        {"resposta": "azul", "pontuacao": 5},
        {"resposta": "branco", "pontuacao": 20},
      ]
    },
    {
      "texto": "Qual o seu CIDADE favorito?",
      "respostas": [
        {"resposta": "dog", "pontuacao": 10},
        {"resposta": "cat", "pontuacao": 5},
        {"resposta": "elefante", "pontuacao": 20},
      ]
    },
    {
      "texto": "Qual a sua ESTADO favorita?",
      "respostas": [
        {"resposta": "preto", "pontuacao": 10},
        {"resposta": "azul", "pontuacao": 5},
        {"resposta": "branco", "pontuacao": 20},
      ]
    },
  ];

  reiniciar() {
    setState(() {
      perguntaSelecionada = 0;
      fim = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("perguntas")),
        body: fim
            ? QuestionarioWidget(
                perguntaSelecionada: perguntaSelecionada,
                perguntas: perguntas,
                responder: responder,
              )
            : ResultadoWidget(
                reiniciar: reiniciar,
                nota: acumuladorNotas,
              ),
      ),
    );
  }
}
