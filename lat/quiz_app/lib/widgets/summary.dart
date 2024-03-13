import 'package:flutter/material.dart';

class MySummary extends StatelessWidget {
  const MySummary({super.key, required this.dataSummary});

  final List<Map<String, Object>> dataSummary;
  // final tes = [
  //   's':['s'],
  // ]
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ...dataSummary.map((e) {
                Color myColor = e['answers'] == e['user_answers']
                    ? Colors.green
                    : Colors.red;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: myColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 20,
                          height: 20,
                          child: Center(
                            child: Text(((e['index'] as int) + 1).toString()),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['question'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  e['user_answers'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  e['answers'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
