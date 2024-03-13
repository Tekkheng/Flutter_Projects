import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meals});
  final MealModel meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meals);
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavorite(meals);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isAdded
                        ? "Meal added as favorite!"
                        : "Meals is no longer favorite!",
                  ),
                  duration: const Duration(
                    seconds: 3,
                  ),
                  action: SnackBarAction(label: "Okay", onPressed: () {}),
                ),
              );
            },
            // icon: Icon(isFavorite ? Icons.star : Icons.star),
            icon: isFavorite
                ? Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  )
                : const Icon(
                    Icons.star_border,
                  ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    meals.imageUrl,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Ingredients: ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                const SizedBox(
                  height: 5,
                ),
                ...meals.ingredients.map(
                  (ing) => Text(
                    ing,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                // for (final ing in meals.ingredients)
                //   Text(
                //     ing,
                //     style: Theme.of(context)
                //         .textTheme
                //         .headlineLarge!
                //         .copyWith(color: Theme.of(context).colorScheme.onBackground),
                //   ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Steps: ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                const SizedBox(
                  height: 5,
                ),
                ...meals.steps.asMap().entries.map(
                      (meals) => Text(
                        "${meals.key + 1}. ${meals.value}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
