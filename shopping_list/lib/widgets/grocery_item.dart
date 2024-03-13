import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery.dart';

class GroceryItems extends StatelessWidget {
  const GroceryItems(
      {super.key, required this.groceryItem, required this.removeItem});
  final GroceryModel groceryItem;
  final void Function(GroceryModel) removeItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          key: ValueKey(groceryItem.id),
          onDismissed: (direction) {
            removeItem(groceryItem);
          },
          child: ListTile(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     title: const Text("Title"),
              //     content: const Text("dashjdkjasdasdasd"),
              //     actions: [
              //       TextButton.icon(
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //         icon: const Icon(Icons.abc),
              //         label: const Text("okay"),
              //       )
              //     ],
              //   ),
              // );
            },
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItem.category.color,
            ),
            title: Text(groceryItem.name),
            trailing: Text(groceryItem.quantity.toString()),
          ),
        ),
      ],
    );
  }
}
