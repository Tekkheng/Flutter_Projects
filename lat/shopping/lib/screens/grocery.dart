import 'package:flutter/material.dart';
import 'package:shopping/data/grocery.dart';
import 'package:shopping/models/grocery.dart';
import 'package:shopping/screens/add_grocery.dart';
import 'package:shopping/widgets/grocery_items.dart';

class Grocery extends StatefulWidget {
  const Grocery({super.key});

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  void _toAddGroceryScreen() async {
    final newGrocery = await Navigator.push<GroceryModel>(
      context,
      MaterialPageRoute(builder: (ctx) => const AddGrocery()),
    );
    if (newGrocery == null) {
      return;
    }
    setState(() {
      groceryItems.add(newGrocery);
    });
  }

  void _removeGrocery(GroceryModel item) {
    final index = groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Are you sure want to remove this grocery?'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              groceryItems.insert(index, item);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = groceryItems.isEmpty
        ? const Center(child: Text('Grocery Still Empty, try add grocery!'))
        : ListView.builder(
            itemCount: groceryItems.length,
            itemBuilder: (ctx, index) => GroceryItems(
              groceryItem: groceryItems[index],
              methodRemove: _removeGrocery,
            ),
          );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
              onPressed: _toAddGroceryScreen, icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
