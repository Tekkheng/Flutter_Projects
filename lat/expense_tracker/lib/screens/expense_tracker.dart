import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/add_item.dart';
import 'package:expense_tracker/widgets/list_items.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  List<ExpenseModels> expenseItems = [
    ExpenseModels(
      title: 'tes',
      price: 200,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModels(
      title: 'dddes',
      price: 400,
      date: DateTime.now(),
      category: Category.traveling,
    ),
  ];

  void openModal() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => AddItem(addItem: addItem),
    );
  }

  void addItem(ExpenseModels item) {
    setState(() {
      expenseItems.add(item);
    });
  }

  void removeItem(ExpenseModels item) {
    final indexItem = expenseItems.indexOf(item);
    setState(() {
      expenseItems.remove(item);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('yakin mau hapus item ini?'),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              expenseItems.insert(indexItem, item);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = expenseItems.isEmpty
        ? const Center(child: Text('Data masih kosong silahkan add data'))
        : Column(
            children: [
              for (final item in expenseItems)
                ItemsList(item: item, removeItem: removeItem),
            ],
          );
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Expense APP'),
        ),
        actions: [
          IconButton(onPressed: openModal, icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
