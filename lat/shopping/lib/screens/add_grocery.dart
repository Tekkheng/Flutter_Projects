import 'package:flutter/material.dart';
import 'package:shopping/data/category.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery.dart';

class AddGrocery extends StatefulWidget {
  const AddGrocery({super.key});

  @override
  State<AddGrocery> createState() => _AddGroceryState();
}

class _AddGroceryState extends State<AddGrocery> {
  final formKey = GlobalKey<FormState>();

  String name = '';
  int quantity = 1;
  var selectedCategory = categories[Categories.vegetables]!;

  void _onSumbit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.of(context).pop(
        GroceryModel(
          id: DateTime.now().toString(),
          name: name,
          quantity: quantity,
          category: selectedCategory,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add New Grocery')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                onSaved: (value) {
                  setState(() {
                    name = value!;
                  });
                },
                validator: (value) {
                  if (value!.trim().length > 50 ||
                      value.trim().length <= 1 ||
                      value.isEmpty) {
                    return 'name character must be between 0 and 50';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 50,
                      keyboardType: TextInputType.number,
                      initialValue: quantity.toString(),
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      onSaved: (value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      validator: (value) {
                        if (int.tryParse(value!) == null ||
                            int.tryParse(value)! <= 0 ||
                            value.length > 10000 ||
                            value.isEmpty) {
                          return 'invalid quantity';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  DropdownButton(
                    value: selectedCategory,
                    items: [
                      for (final item in categories.entries)
                        DropdownMenuItem(
                          value: item.value,
                          child: Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                color: item.value.color,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(item.value.title),
                            ],
                          ),
                        ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      formKey.currentState!.reset();
                    },
                    child: const Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: _onSumbit,
                    child: const Text("Submit Form"),
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
