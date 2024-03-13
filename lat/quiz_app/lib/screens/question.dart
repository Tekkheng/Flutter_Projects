import 'package:flutter/material.dart';
import 'package:quiz_app/data/dummy.data.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.storeAnswers});

  final void Function(String) storeAnswers;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;
  void nextQuestion(String answer) {
    setState(() {
      if (index < data.length - 1) {
        index++;
      }
    });
    widget.storeAnswers(answer);
  }

  @override
  Widget build(BuildContext context) {
    final datas = data.map((d) => d).toList();
    final answers = datas[index].shuffleAnswers;
    return Container(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              datas[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...answers.map(
              (a) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onPressed: () {
                    nextQuestion(a);
                  },
                  child: Text(
                    a,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
