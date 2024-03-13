import 'package:expense_tracker_app/widgets/expense_card.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems({super.key, required this.expenseItems, required this.removeExpense});

  final List<Expense> expenseItems;
  final void Function(Expense items) removeExpense;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenseItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(color: Theme.of(context).colorScheme.onPrimary,),
            key: ValueKey(expenseItems[index]),
            onDismissed: (direction){
              removeExpense(expenseItems[index]);
            },
            child: ExpenseCard(
              expenseItems: expenseItems[index],
            ),
          );
        },
      ),
    );
  }
} 
