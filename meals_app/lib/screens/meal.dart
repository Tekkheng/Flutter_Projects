import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/meal_items.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meals, this.mealsTitle});
  final String? mealsTitle;
  final List<MealModel> meals;

  void toMealsDetail(BuildContext context, MealModel meals) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meals: meals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetMeals = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItems(
        meal: meals[index],
        toMealsDetail: () {
          toMealsDetail(context, meals[index]);
        },
      ),
    );

    if (meals.isEmpty) {
      widgetMeals = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh ... nothing here!",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Try selecting a different category!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    if (mealsTitle == null) {
      return widgetMeals;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsTitle!),
      ),
      body: widgetMeals,
    );
  }
}
