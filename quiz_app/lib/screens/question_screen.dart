import 'package:flutter/material.dart';
import 'package:quiz_app/components/styled_button.dart';
import 'package:quiz_app/components/styled_text.dart';
import 'package:quiz_app/data/data_dummy.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.storeAnswers});

  final void Function(String) storeAnswers;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var index = 0;

  void nextQuiz(String answer) {
    setState(() {
      if (index < data.length - 1) {
        index++;
      }
      widget.storeAnswers(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = data[index].question;
    final answers = data[index].shuffleAnswers;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
                txt: question,
                fsize: 20,
                color: Colors.white,
                fweight: 'normal',
                txtAlign: 'center',),
            const SizedBox(
              height: 40,
            ),
            ...answers.map(
              (item) {
                return StyledButton(
                    txt: item,
                    fontColor: Colors.white,
                    buttonColor: const Color.fromARGB(88, 104, 28, 236),
                    jenisButton: 'elevated',
                    onTap: () {
                      nextQuiz(item);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
