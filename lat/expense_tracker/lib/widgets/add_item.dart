import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key, required this.addItem});

  final void Function(ExpenseModels) addItem;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  DateTime? selectedDate;
  Category selectedCategory = Category.traveling;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    priceController.dispose();
  }

  void submitExpense() {
    final enteredAmount = double.tryParse(priceController.text);
    final invalidAmount = enteredAmount == null || enteredAmount < 0;
    if (titleController.text.trim().isEmpty ||
        invalidAmount ||
        selectedDate == null) {
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
    widget.addItem(
      ExpenseModels(
        title: titleController.text,
        price: enteredAmount,
        date: selectedDate!,
        category: selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

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
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title: '),
            ),
            controller: titleController,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('price: '),
                    prefix: Text('\$ '),
                  ),
                  controller: priceController,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                selectedDate == null
                    ? 'No Selected Date'
                    : formatter.format(selectedDate!),
              ),
              IconButton(
                onPressed: _getDatePicker,
                icon: const Icon(Icons.date_range),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButton(
                    value: selectedCategory,
                    items: Category.values
                        .map(
                          (c) => DropdownMenuItem(
                            value: c,
                            child: Text(c.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    }),
              ),
              const SizedBox(
                width: 40,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: submitExpense,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  foregroundColor: Theme.of(context).colorScheme.background,
                ),
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
