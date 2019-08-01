import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predsednik/question.dart';
import 'package:predsednik/result.dart';

import 'answer.dart';

class Quiz extends StatefulWidget {
  Quiz();

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final questions = [
    {
      'questionText': "Za koga je Vucic spremio zatvorsku kosulju sa slike?",
      'answers': [
        'Mlađana Dinkića',
        'Borisa Tadića',
        'Tomislava Nikolića',
        'Dragana Đilasa'
      ],
      'correct': 'Mlađana Dinkića',
      'image': "vucic1.jpg"
    },
    {
      'questionText':
          "Prema Vučićevim rečima, koliko je Muslimana potrebno ubiti za jednog ubijenog Srbina?",
      'answers': ['10', '1', '50', '100'],
      'correct': '100',
      'image': "vucic2.jpg"
    },
    {
      'questionText': "Ko je prvi srpski državnik koji se rukovao sa Tačijem?",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    },
    {
      'questionText': "4",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    },
    {
      'questionText': "5",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    },
    {
      'questionText': "6",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    },
    {
      'questionText': "7",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    },
    {
      'questionText': "8",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    },
    {
      'questionText': "9",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    },
    {
      'questionText': "10",
      'answers': ['Tadić', 'Dačić', 'Vučić', 'Nikolić'],
      'correct': 'Vučić',
      'image': "vucic3.jpg"
    }
  ];
  static final int totalQuestions = 6;
  final Random rng = new Random();

  @override
  void initState() {
    questionIndex = rng.nextInt(questions.length - 1);
    questionsSoFar = 0;
    previosQuestions = [questionIndex];
    result = 0;
    mili = DateTime.now().millisecondsSinceEpoch;
    super.initState();
  }

  int questionIndex;
  int questionsSoFar;
  List<int> previosQuestions;
  var result;
  var mili;

  void answerQuestion(String ans) {
    print(questionIndex);
    if (questions[questionIndex]['correct'] == ans) {
      setState(() {
        result +=
            max(30000 - (DateTime.now().millisecondsSinceEpoch - mili), 0);
      });
    }
    if (questionsSoFar < totalQuestions - 1) {
      setState(() {
        questionsSoFar++;
        while (previosQuestions.contains(questionIndex)) {
          questionIndex = rng.nextInt(questions.length - 1);
        }
        previosQuestions.add(questionIndex);
        mili = DateTime.now().millisecondsSinceEpoch;
      });
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Result(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CenterText(
                "Pitanje " + (questionsSoFar + 1).toString() + " od " + totalQuestions.toString()
              ),
            ),
            Expanded(
              flex: 2,
              child: CenterText(
                questions[questionIndex]['questionText'],
              ),
            ),
            Expanded(
              flex: 5,
              child: Image.asset(
                "images/" + questions[questionIndex]['image'],
                fit: BoxFit.fitHeight,
              ),
            ),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Expanded(
                flex: 1,
                child: Answer(() => answerQuestion(answer), answer),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
