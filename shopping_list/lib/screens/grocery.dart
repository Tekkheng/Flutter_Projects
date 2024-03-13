import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/category.dart';
// import 'package:shopping_list/data/grocery.dart';
import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_item.dart';
import 'package:http/http.dart' as http;

class Grocery extends StatefulWidget {
  const Grocery({super.key});

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  var _isLoading = true;
  List<GroceryModel> _groceryItems = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    try {
      final url = Uri.https(
          'flutter-backend-57b18-default-rtdb.asia-southeast1.firebasedatabase.app',
          'shopping-list.json');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> listData = jsonDecode(response.body);
        final List<GroceryModel> data = [];
        for (final item in listData.entries) {
          final category = categories.entries
              .firstWhere(
                (catitem) => catitem.value.title == item.value['category'],
              )
              .value;
          data.add(
            GroceryModel(
              id: item.key,
              name: item.value['name'],
              quantity: item.value['quantity'],
              category: category,
            ),
          );
        }
        setState(() {
          _groceryItems = data;
          _isLoading = false;
        });
      } else {
        print('gagal');
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      print(err);
    }
  }

  void _toAddItemScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewItemScreen(),
      ),
    );
    getData();
  }

  void _removeItem(GroceryModel value) async {
    // setState(() {
    //   _groceryItems.remove(value);
    // });
    try {
      final url = Uri.https(
          'flutter-backend-57b18-default-rtdb.asia-southeast1.firebasedatabase.app',
          'shopping-list/${value.id}.json');
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        print('success removeItem');
      } else {
        print('failed removeItem');
      }
      getData();
    } catch (err) {
      print(err);
    }

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('remove?'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () async {
            final Map<String, dynamic> data = {
              'name': value.name,
              'quantity': value.quantity,
              'category': value.category.title,
            };
            final response = await http.post(
              Uri.https(
                'flutter-backend-57b18-default-rtdb.asia-southeast1.firebasedatabase.app',
                'shopping-list.json',
              ),
              body: jsonEncode(data),
              headers: {'Content-Type': 'application/json'},
            );
            getData();
            if (response.statusCode == 200) {
              print('succes balikin item');
            } else {
              print('failed balikin item');
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget content = _groceryItems.isEmpty
    //     ? const Center(
    //         child: Text("Grocery Still Empty, try to add grocery!"),
    //       )
    //     : ListView.builder(
    //         itemCount: _groceryItems.length,
    //         itemBuilder: (ctx, index) => GroceryItems(
    //           groceryItem: _groceryItems[index],
    //           removeItem: _removeItem,
    //         ),
    //       );

    Widget content = const Center(
      child: Text("Grocery Still Empty, try to add grocery!"),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => GroceryItems(
          groceryItem: _groceryItems[index],
          removeItem: _removeItem,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: () {
              _toAddItemScreen(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
