// import 'package:flutter/material.dart';
// import 'package:quiz_app/components/styled_button.dart';
// import 'package:quiz_app/components/styled_text.dart';
// import 'package:quiz_app/data/data_dummy.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen(
//       {super.key, required this.myAnswers, required this.restart});

//   final List<String> myAnswers;
//   final void Function() restart;

//   List<Map<String, Object>> getSummary() {
//     final List<Map<String, Object>> summary = [];

//     for (var i = 0; i < data.length; i++) {
//       summary.add({
//         'index': i,
//         'questions': data[i].question,
//         'answers': data[i].answers[0],
//         'user_answers': myAnswers[i],
//       });
//     }
//     return summary;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dataSummary = getSummary();
//     final correctAnswers = dataSummary.where((dat) {
//       return dat['answers'] == dat['user_answers'];
//     });

//     final numQuestions = data.length;
//     final numCorrect = correctAnswers.length;

//     Widget renderData = SizedBox(
//       height: 400,
//       child: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.all(25),
//           child: Column(
//               children: dataSummary.map((data) {
//             return Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20),
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       border: Border.all(
//                         color: const Color.fromARGB(48, 7, 255, 102),
//                       ),
//                       color: const Color.fromARGB(69, 7, 255, 102),
//                     ),
//                     child: StyledText(
//                       color: Colors.white,
//                       fsize: 15,
//                       txt: '${((data['index'] as int) + 1).toString()}.',
//                       fweight: 'normal',
//                       txtAlign: 'center',
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Text(data['questions'] as String),
//                         StyledText(
//                           txt: data['questions'] as String,
//                           fsize: 15,
//                           color: Colors.white,
//                           fweight: 'normal',
//                           txtAlign: 'left',
//                         ),
//                         StyledText(
//                           txt: data['user_answers'] as String,
//                           fsize: 15,
//                           color: Colors.white,
//                           fweight: 'normal',
//                           txtAlign: 'left',
//                         ),
//                         StyledText(
//                           txt: data['answers'] as String,
//                           fsize: 15,
//                           color: Colors.white,
//                           fweight: 'normal',
//                           txtAlign: 'left',
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }).toList()),
//         ),
//       ),
//     );

//     return SizedBox(
//       width: double.infinity,
//       child: Container(
//         margin: const EdgeInsets.only(top: 100),
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StyledText(
//               txt:
//                   'You Answered $numCorrect of $numQuestions questions correctly!',
//               fsize: 18,
//               color: Colors.white,
//               fweight: 'bold',
//               txtAlign: 'center',
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             renderData,
//             const SizedBox(
//               height: 40,
//             ),
//             StyledButton(
//                 txt: 'Restart Quiz',
//                 fontColor: Colors.white,
//                 buttonColor: Colors.white,
//                 jenisButton: 'outline',
//                 onTap: restart)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quiz_app/components/styled_button.dart';
import 'package:quiz_app/components/styled_text.dart';
import 'package:quiz_app/result_summary.dart';
import 'package:quiz_app/data/data_dummy.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.restart, required this.myAnswers});

  final void Function() restart;
  final List<String> myAnswers;

  List<Map<String, Object>> get mySummary {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < data.length; i++) {
      summary.add(
        {
          'questions': data[i].question,
          'answers': data[i].answers[0],
          'user_answers': myAnswers[i],
          'index': i,
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, Object>> dataSummary = getSummary();

    final List<Map<String, Object>> correctAnswers = mySummary
        .where(
          (data) => data['answers'] == data['user_answers'],
        )
        .toList();

    final numCorrectAnswers = correctAnswers.length;
    final numQuestions = data.length;

    Widget showSummary = ResultSummary(
      dataSummary: mySummary,
    );
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
              txt:
                  'You Answered $numCorrectAnswers out of $numQuestions Questions Correctly!',
              fsize: 18,
              color: Colors.white,
              fweight: 'bold',
              txtAlign: 'center',
            ),
            const SizedBox(
              height: 15,
            ),
            showSummary,
            const SizedBox(
              height: 40,
            ),
            StyledButton(
              txt: 'Restart Quiz',
              fontColor: Colors.white,
              buttonColor: Colors.white,
              jenisButton: 'outline',
              onTap: restart,
            ),
          ],
        ),
      ),
    );
  }
}
