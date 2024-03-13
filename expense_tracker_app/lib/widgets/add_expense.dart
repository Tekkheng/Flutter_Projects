import 'dart:io';

import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.addItems});

  final void Function(Expense) addItems;
  @override
  State<AddExpense> createState() {
    return _AddExpense();
  }
}

class _AddExpense extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category? _selectedCategory = Category.food;

  void _getDatePicker() async {
    final datenow = DateTime.now();
    final firstDate = DateTime(datenow.year - 1, datenow.month, datenow.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: datenow,
      firstDate: firstDate,
      lastDate: datenow,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void submitExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final invalidAmount = enteredAmount == null || enteredAmount < 0;
    if (_titleController.text.trim().isEmpty ||
        invalidAmount ||
        _selectedDate == null) {
      if (Platform.isIOS) {
        showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                  'Please make sure you input data title,amount,date,category correctly!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('okay'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                  'Please make sure you input data title,amount,date,category correctly!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('okay'),
                ),
              ],
            );
          },
        );
      }

      return;
    }
    widget.addItems(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectDate = _selectedDate == null
        ? 'No Selected Date'
        : formatter.format(_selectedDate!);

    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    Widget portraitUp = Column(children: [
      TextField(
        maxLength: 50,
        controller: _titleController,
        decoration: const InputDecoration(
          label: Text('Title: '),
        ),
      ),
      Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: const InputDecoration(
                label: Text('Amount:'),
                prefixText: '\$ ',
              ),
            ),
          ),
          const SizedBox(
            width: 28,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(selectDate),
                IconButton(
                  onPressed: _getDatePicker,
                  icon: const Icon(Icons.date_range),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 28,
      ),
      Row(children: [
        DropdownButton(
          value: _selectedCategory,
          items: Category.values
              .map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name.toUpperCase(),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedCategory = value;
            });
          },
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // setState(() {
            //   _title = "";
            //   _amount = "";
            // });
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: submitExpense,
          child: const Text('Save Expense'),
        ),
      ]),
    ]);

    Widget landscape = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                maxLength: 50,
                controller: _titleController,
                decoration: const InputDecoration(
                  label: Text('Title: '),
                ),
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: const InputDecoration(
                  label: Text('Amount:'),
                  prefixText: '\$ ',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(selectDate),
                  IconButton(
                    onPressed: _getDatePicker,
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                // setState(() {
                //   _title = "";
                //   _amount = "";
                // });
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: submitExpense,
              child: const Text('Save Expense'),
            ),
          ],
        )
      ],
    );

    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      // print(maxWidth);
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboard + 16),
            child: Column(
              children: [
                maxWidth >= 600 ? landscape : portraitUp,
              ],
            ),
          ),
        ),
      );
    });
  }
}
