import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.mealItems, this.title});
  final String? title;
  final List<MealModel> mealItems;

  void toDetailsScreen(BuildContext context, MealModel meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          mealItemsDetail: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetMeals = ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: mealItems.length,
      itemBuilder: (ctx, index) => MealItem(
        mealItems: mealItems[index],
        route: () {
          toDetailsScreen(context, mealItems[index]);
        },
      ),
    );
    if (mealItems.isEmpty) {
      widgetMeals = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    if (title == null) {
      return widgetMeals;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: widgetMeals,
    );
  }
}
