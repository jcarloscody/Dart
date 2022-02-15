import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionsIndex = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'who\'s your favorite instructor?',
      'answers': [
        {'text': 'Maz', 'score': 1},
        {'text': 'Mario', 'score': 1},
        {'text': 'Lucas', 'score': 1},
        {'text': 'Jose', 'score': 1},
      ]
    },
  ];

  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("First App"),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              _questionsIndex < _questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questions: _questions,
                      questionsIndex: _questionsIndex,
                    )
                  : Result(resultScore: _totalScore, resetQuiz: _resetQuiz)
            ],
          )),
    );
  }
}
