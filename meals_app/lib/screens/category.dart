import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal.dart';
import 'package:meals_app/widgets/category_grid_items.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.availableMeals});
  final List<MealModel> availableMeals;
  void toMealsScreen(BuildContext context, CategoryModel category) {
    final filterMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          meals: filterMeals,
          mealsTitle: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        ...categoryData
            .map(
              (category) => CategoryGridItems(
                categoryItems: category,
                toMealsScreen: () {
                  toMealsScreen(context, category);
                },
              ),
            )
            .toList(),
      ],
    );
  }
}
