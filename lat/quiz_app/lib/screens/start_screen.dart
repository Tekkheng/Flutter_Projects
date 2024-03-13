import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.changeScreen});
  final void Function() changeScreen;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(79, 255, 255, 255),
            width: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Learn Flutter with the fun way!',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: changeScreen,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
