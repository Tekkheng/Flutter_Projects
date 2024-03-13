import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.allExpense});

  final Expenses allExpense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              allExpense.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            Row(
              children: [
                Text(
                  allExpense.amount.toStringAsFixed(2),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[allExpense.category],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(allExpense.formatedDate),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
