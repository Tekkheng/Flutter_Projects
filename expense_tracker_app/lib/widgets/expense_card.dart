import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expenseItems});

  final Expense expenseItems;
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.all(10),
      // color: const Color.fromARGB(174, 250, 230, 255),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseItems.title,
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '\$ ${expenseItems.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(categoryIcons[expenseItems.category]),
                ),
                Text(expenseItems.formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
