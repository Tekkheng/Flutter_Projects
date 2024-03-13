import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems(
      {super.key, required this.categoryItems, required this.toMealsScreen});
  final CategoryModel categoryItems;
  final void Function() toMealsScreen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toMealsScreen,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              categoryItems.color.withOpacity(0.55),
              categoryItems.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoryItems.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
