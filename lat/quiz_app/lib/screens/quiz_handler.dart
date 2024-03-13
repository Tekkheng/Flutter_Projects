import 'package:flutter/material.dart';
import 'package:quiz_app/data/dummy.data.dart';
import 'package:quiz_app/screens/question.dart';
import 'package:quiz_app/screens/result.dart';
import 'package:quiz_app/screens/start_screen.dart';

class QuizHandlerScreen extends StatefulWidget {
  const QuizHandlerScreen({super.key});

  @override
  State<QuizHandlerScreen> createState() => _QuizHandlerScreenState();
}

class _QuizHandlerScreenState extends State<QuizHandlerScreen> {
  String myScreen = 'start-screen';
  List<String> _storedAnswers = [];

  void _storeAnswers(String answer) {
    setState(() {
      _storedAnswers.add(answer);
    });

    if (_storedAnswers.length == data.length) {
      setState(() {
        myScreen = 'result-screen';
      });
    }
  }

  void _changeScreen() {
    setState(() {
      myScreen = 'question-screen';
    });
  }

  void _restart() {
    setState(() {
      myScreen = 'start-screen';
      _storedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = StartScreen(changeScreen: _changeScreen);
    if (myScreen == 'question-screen') {
      currentWidget = QuestionScreen(storeAnswers: _storeAnswers);
    } else if (myScreen == 'result-screen') {
      currentWidget = ResultScreen(storedAnswers: _storedAnswers, restart:_restart);
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: currentWidget,
      ),
    );
  }
}
