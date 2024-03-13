import 'package:flutter/material.dart';
import 'package:foodwiki_app/data/datafood.dart';
import 'package:foodwiki_app/models/category_models.dart';
import 'package:foodwiki_app/models/food_models.dart';
import 'package:foodwiki_app/screens/food_screen.dart';
import 'package:foodwiki_app/widgets/category_griditems.dart';

class FoodCategoryScreens extends StatelessWidget {
  const FoodCategoryScreens(
      {super.key, this.toggleFavoriteFood, required this.availableFoods});
  final void Function(FoodModel)? toggleFavoriteFood;
  final List<FoodModel> availableFoods;
  void navigateTofoodScreen(BuildContext context, CategoryModel category) {
    final filteredFood = availableFoods
        .where(
          (food) => food.categories.contains(category.id),
        )
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => FoodScreen(
            title: category.title,
            food: filteredFood,
            toggleFavoriteFood: toggleFavoriteFood!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in dataCategory)
          CategoryGridItems(
            categoryItems: category,
            onTap: () {
              navigateTofoodScreen(context, category);
            },
          ),
      ],
    );
  }
}
