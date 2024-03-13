import 'package:flutter/material.dart';
import 'package:quiz_app/data/dummy.data.dart';
import 'package:quiz_app/widgets/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.storedAnswers, required this.restart});
  final List<String> storedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get dataSummary {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < data.length; i++) {
      summary.add(
        {
          'question': data[i].title,
          'answers': data[i].answers[0],
          'user_answers': storedAnswers[i],
          'index': i,
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> correctAnswers =
        dataSummary.where((d) => d['user_answers'] == d['answers']).toList();

    Widget content = MySummary(dataSummary: dataSummary);
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(30, 90, 30, 30),
          child: Column(
            children: [
              Text(
                'anda berhasil menjawab ${correctAnswers.length} dari ${data.length} pertanyaan dengan benar!',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              content,
              OutlinedButton.icon(
                onPressed: restart,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
