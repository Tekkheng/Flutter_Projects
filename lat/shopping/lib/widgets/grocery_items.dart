import 'package:flutter/material.dart';
import 'package:shopping/models/grocery.dart';

class GroceryItems extends StatelessWidget {
  const GroceryItems(
      {super.key, required this.groceryItem, required this.methodRemove});

  final GroceryModel groceryItem;
  final void Function(GroceryModel) methodRemove;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(groceryItem.id),
      onDismissed: (isDismiss) {
        methodRemove(groceryItem);
      },
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Container(
              height: 24,
              width: 24,
              color: groceryItem.category.color,
            ),
            title: Text(groceryItem.name),
            trailing: Text(groceryItem.quantity.toString()),
          ),
        ],
      ),
    );
  }
}
