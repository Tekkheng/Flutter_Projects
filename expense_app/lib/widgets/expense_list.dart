import 'package:expense_app/models/expenses.dart';
import 'package:expense_app/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.allExpense, required this.removeExpense});

  final List<Expenses> allExpense;
  final void Function(Expenses) removeExpense;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: allExpense.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(allExpense[index]),
            onDismissed: (direction) {
              removeExpense(allExpense[index]);
            },
            child: ExpenseCard(
              allExpense: allExpense[index],
            ),
          );
        },
      ),
    );
  }
}
