import 'package:expense_app/models/expenses.dart';
import 'package:expense_app/widgets/add_expense.dart';
import 'package:expense_app/widgets/charts/chart.dart';
import 'package:expense_app/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseTracker();
  }
}

class _ExpenseTracker extends State<ExpenseTracker> {
  final List<Expenses> _allExpense = [];
  void _openModalAdd(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(newExpense: _newExpense),
    );
  }

  void _newExpense(Expenses newExpense) {
    setState(() {
      _allExpense.add(newExpense);
    });
  }

  void _removeExpense(Expenses newExpense) {
    final itemIndex = _allExpense.indexOf(newExpense);
    setState(() {
      _allExpense.remove(newExpense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Delete Expense?'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _allExpense.insert(itemIndex, newExpense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget showExpense = _allExpense.isNotEmpty
        ? ExpenseList(allExpense: _allExpense, removeExpense: _removeExpense)
        : const Center(
            child: Text("No Expense list added, please add expense!"));
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Expenses Tracker')),
        actions: [
          IconButton(
            onPressed: () {
              _openModalAdd(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _allExpense),
                const SizedBox(
                  height: 10,
                ),
                showExpense,
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _allExpense),
                ),
                const SizedBox(
                  height: 10,
                ),
                showExpense,
              ],
            ),
    );
  }
}
