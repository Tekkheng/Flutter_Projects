import 'package:flutter/material.dart';
import 'package:quiz_app/components/styled_button.dart';
import 'package:quiz_app/components/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.changeScreen});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(83, 255, 255, 255),
            width: 300,
          ),
          const SizedBox(
            height: 60,
          ),
          const StyledText(
            txt: 'Learn Flutter with fun way!',
            fsize: 20,
            color: Colors.white,
            fweight: 'bold',
            txtAlign: 'center',
          ),
          const SizedBox(
            height: 40,
          ),
          StyledButton(
            txt: 'Start Quiz',
            fontColor: Colors.white,
            buttonColor: Colors.deepPurple,
            jenisButton: 'outline',
            onTap: changeScreen,
          ),
        ],
      ),
    );
  }
}
