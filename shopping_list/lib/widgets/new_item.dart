import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/category.dart';
import 'package:shopping_list/models/category.dart';
// import 'package:shopping_list/models/grocery.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  var _isSending = false;

  final _fromKey = GlobalKey<FormState>();

  String _enteredName = "";
  int _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _submitForm() async {
    if (_fromKey.currentState!.validate()) {
      _fromKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      // Navigator.of(context).pop(
      //   GroceryModel(
      //     id: DateTime.now().toString(),
      //     name: _enteredName,
      //     quantity: _enteredQuantity,
      //     category: _selectedCategory,
      //   ),
      // );

      final url = Uri.https(
          'flutter-backend-57b18-default-rtdb.asia-southeast1.firebasedatabase.app',
          'shopping-list.json');
      final Map<String, dynamic> data = {
        'name': _enteredName,
        'quantity': _enteredQuantity,
        'category': _selectedCategory.title,
      };
      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        );

        if (!context.mounted) {
          return;
        }
        _fromKey.currentState!.reset();
        Navigator.of(context).pop();

        // if (response.statusCode == 200) {
        //   showDialog(
        //     context: context,
        //     builder: (ctx) => AlertDialog(
        //       title: const Text("Success"),
        //       content: const Text("Add new item success"),
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             _fromKey.currentState!.reset();
        //             Navigator.pop(context);
        //           },
        //           child: const Text("Okay"),
        //         ),
        //       ],
        //     ),
        //   );
        // } else {
        //   showDialog(
        //     context: context,
        //     builder: (ctx) => AlertDialog(
        //       title: const Text("Failed"),
        //       content: const Text("Add new item Failed"),
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           child: const Text("Okay"),
        //         ),
        //       ],
        //     ),
        //   );
        // }
      } catch (err) {
        print('gagal woi');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _fromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length > 50 ||
                    value.trim().length <= 1) {
                  return "Must be between 1 and 50 characters.";
                }
                return null;
              },
              onSaved: (value) => _enteredName = value!,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Quantity'),
                    ),
                    initialValue: '1',
                    validator: (value) {
                      if (value == null ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! <= 0) {
                        return "Must be valid, positive number.";
                      }
                      return null;
                    },
                    onSaved: (value) => _enteredQuantity = int.parse(value!),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                // Expanded(
                //   child: DropdownButtonFormField(
                //     items: categories.entries
                //         .map(
                //           (e) => DropdownMenuItem(
                //             child: Text(e.value.title),
                //           ),
                //         )
                //         .toList(),
                //     onChanged: (value) {},
                //   ),
                // ),
                Expanded(
                  child: DropdownButtonFormField(
                    value: _selectedCategory,
                    items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                color: category.value.color,
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(category.value.title),
                            ],
                          ),
                        ),
                    ],
                    onChanged: (value) {
                      // print(value);
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _isSending
                      ? null
                      : () {
                          _fromKey.currentState!.reset();
                        },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(40, 40),
                  ),
                  child: const Text("Reset"),
                ),
                ElevatedButton(
                  onPressed: _isSending ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(40, 40),
                  ),
                  child: _isSending
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(),
                        )
                      : const Text("Submit Form"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
