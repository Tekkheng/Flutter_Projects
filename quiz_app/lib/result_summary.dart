import 'package:flutter/material.dart';
import 'package:quiz_app/components/styled_text.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary(
      {super.key, required this.dataSummary});

  final List<Map<String, Object>> dataSummary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: dataSummary.map((data) {
              Color bgColor = data['answers'] == data['user_answers']
                  ? const Color.fromARGB(255, 7, 176, 255) // Green
                  : const Color.fromARGB(255, 255, 0, 247); // Red
              return Row(
                children: [
                  //  Text(((data['index'] as int) + 1).toString()) ,
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: StyledText(
                        txt: ((data['index'] as int) + 1).toString(),
                        fsize: 15,
                        color: Colors.black,
                        fweight: 'normal',
                        txtAlign: 'center'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyledText(
                            txt: data['questions'] as String,
                            fsize: 15,
                            color: Colors.white,
                            fweight: 'normal',
                            txtAlign: 'left',
                          ),
                          StyledText(
                            txt: data['user_answers'] as String,
                            fsize: 15,
                            color: const Color.fromARGB(255, 211, 130, 238),
                            fweight: 'normal',
                            txtAlign: 'left',
                          ),
                          StyledText(
                            txt: data['answers'] as String,
                            fsize: 15,
                            color: const Color.fromARGB(255, 147, 207, 235),
                            fweight: 'normal',
                            txtAlign: 'left',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
