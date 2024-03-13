import 'package:expense_app/models/expenses.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.newExpense});
  final void Function(Expenses) newExpense;

  @override
  State<StatefulWidget> createState() {
    return _AddExpense();
  }
}

class _AddExpense extends State<AddExpense> {
  Category? _selectedCategory = Category.food;
  DateTime? _pickedDate;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void pickerDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final datePicked = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now, initialDate: now);

    setState(() {
      _pickedDate = datePicked;
    });
  }

  void submitNewExpense() async {
    // print('${_titleController.text},${_amountController.text}, ${_selectedCategory}, ${_pickedDate}');
    final enteredAmount = double.tryParse(_amountController.text);
    final invalidAmount = enteredAmount == null || enteredAmount < 0;
    if (_titleController.text.trim().isEmpty ||
        invalidAmount ||
        _pickedDate == null) {
      return await showDialog(
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
    widget.newExpense(
      Expenses(
        title: _titleController.text,
        amount: enteredAmount,
        date: _pickedDate!,
        category: _selectedCategory!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final selectDate = _pickedDate == null
        ? "No Selected Date"
        : formatter.format(_pickedDate!);

    final keyboardDistance = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardDistance + 16),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Title : "),
                ),
                controller: _titleController,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Amount : "),
                        prefix: Text('\$ '),
                      ),
                      controller: _amountController,
                    ),
                  ),
                  // Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(selectDate),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                            onPressed: pickerDate,
                            icon: const Icon(Icons.date_range),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                  // Spacer(),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: submitNewExpense,
                    child: const Text('Save Expenses'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
