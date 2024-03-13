import 'package:flutter/material.dart';
import 'package:quiz_app/data/data_dummy.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';

class QuizHandler extends StatefulWidget {
  const QuizHandler({super.key});
  @override
  State<QuizHandler> createState() {
    return _QuizHandler();
  }
}

class _QuizHandler extends State<QuizHandler> {
  var myScreen = 'start-screen';
  List<String> storedAnswers = [];

  void changeScreen() {
    setState(
      () {
        myScreen == 'start-screen'
            ? myScreen = 'question-screen'
            : myScreen = 'start-screen';
      },
    );
  }

  void storeAnswers(String answer) {
    storedAnswers.add(answer);
    if (storedAnswers.length == data.length) {
      setState(() {
        myScreen = 'result-screen';
      });
    }
  }

  void restartScreen() {
    setState(
      () {
        storedAnswers = [];
        myScreen = 'start-screen';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetScreen = StartScreen(changeScreen: changeScreen);
    if (myScreen == 'question-screen') {
      widgetScreen = QuestionScreen(storeAnswers: storeAnswers);
    } else if (myScreen == 'result-screen') {
      widgetScreen =
          ResultScreen(myAnswers: storedAnswers, restart: restartScreen);
    } else {
      widgetScreen = StartScreen(changeScreen: changeScreen);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 64, 151, 251),
            Colors.purpleAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: widgetScreen,
      ),
    );
  }
}
