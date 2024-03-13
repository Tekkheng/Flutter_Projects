import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key, required this.item, required this.removeItem});
  final ExpenseModels item;
  final void Function(ExpenseModels) removeItem;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      onDismissed: (dismis) {
        removeItem(item);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title),
              Row(
                children: [
                  Text('\$ ${item.price}'),
                  const Spacer(),
                  Icon(iconCategory[item.category]),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(formatter.format(DateTime.now())),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
