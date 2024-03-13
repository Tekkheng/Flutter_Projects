import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.items, required this.route});
  final CategoryModel items;
  final void Function() route;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: route,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: items.color),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            items.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}
