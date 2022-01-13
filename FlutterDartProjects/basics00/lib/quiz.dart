// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'answer.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionsIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.questionsIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionsIndex]['questionText']),
        RaisedButton(child: Text("Answer "), onPressed: null),
        RaisedButton(
            child: Text("Answer 2"),
            onPressed: () {
              print("sldk");
            }),
        RaisedButton(
          child: Text("Answer 2"),
          onPressed: () => print("Answer Anonim"),
        ),
        ...(questions[questionsIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
        OutlineButton(
          borderSide: BorderSide(color: Colors.blue),
          textColor: Colors.black,
          onPressed: () {
            print("OutlineButton");
          },
          child: Text("data"),
        ),
        ElevatedButton(
          onPressed: () {
            print(
                "este BUTTUN é atualizado. ele por default pega a cor do tema padrao. substitui o RaisedButton ");
          },
          child: Text("ElevatedButton"),
        ),
        ElevatedButton(
          onPressed: null,
          child: Text("ElevatedButton"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
              foregroundColor: MaterialStateProperty.all(Colors.black)),
        ),
        ElevatedButton(
            onPressed: () {
              print("object");
            },
            child: Text("ElevatedButton"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.red,
            )),
        TextButton(
            onPressed: () {
              print("substitui o FlatButton. se liga no conceito de primary");
            },
            style: TextButton.styleFrom(primary: Colors.green),
            child: Text("TextButton")),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.orange,
              side: BorderSide(color: Colors.black),
            ),
            onPressed: () {
              print("substitui o OutlineButton");
            },
            child: Text("OutlinedButton"))
      ],
    );
  }
}
