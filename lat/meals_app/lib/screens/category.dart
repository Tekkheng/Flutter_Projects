import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key,
      required this.availableMeals});

  final List<MealModel> availableMeals;

  void toMealsScreen(BuildContext context, CategoryModel category) {
    final filterMeals =
        availableMeals.where((m) => m.categories.contains(category.id)).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          mealItems: filterMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      itemCount: categoryData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (ctx, index) => CategoryItem(
        items: categoryData[index],
        route: () {
          toMealsScreen(context, categoryData[index]);
        },
      ),
    );
  }
}
