import 'package:expense_tracker_app/widgets/add_expense.dart';
import 'package:expense_tracker_app/widgets/charts/chart.dart';
import 'package:expense_tracker_app/widgets/expense_items.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});
  @override
  State<ExpenseTracker> createState() {
    return _ExpenseTracker();
  }
}

class _ExpenseTracker extends State<ExpenseTracker> {
  final List<Expense> _registeredExpenses = [
    // Expense(
    //   title: 'haha',
    //   amount: 23833,
    //   date: DateTime.now(),
    //   category: Category.work,
    // ),
    // Expense(
    //   title: 'hoh0',
    //   amount: 83833,
    //   date: DateTime.now(),
    //   category: Category.leisure,
    // ),
    // Expense(
    //   title: 'bebe',
    //   amount: 53833,
    //   date: DateTime.now(),
    //   category: Category.food,
    // ),
  ];

  void _openModalAdd() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return SizedBox(
          width: double.infinity,
          child: AddExpense(
            addItems: _addExpenseItems,
          ),
        );
      },
    );
  }

  void _addExpenseItems(Expense items) {
    setState(() {
      _registeredExpenses.add(items);
    });
  }

  void _removeExpenseItem(Expense items) {
    final itemsIndex = _registeredExpenses.indexOf(items);
    setState(() {
      _registeredExpenses.remove(items);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Delete expense?'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(itemsIndex, items);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    final height = MediaQuery.of(context).size.height;

    Widget mainContent = _registeredExpenses.isNotEmpty
        ? ExpenseItems(
            expenseItems: _registeredExpenses,
            removeExpense: _removeExpenseItem)
        : const Center(child: Text('No expenses found. Start adding some!'));

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Expense Tracker'),
        ),
        actions: [
          IconButton(
            onPressed: _openModalAdd,
            icon: const Icon(Icons.add),
            tooltip: 'Add',
          ),
        ],
      ),
      body: height > 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top:38.0),
                    child: mainContent,
                  ),
                ),
              ],
            ),
    );
  }
}
