import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({
    Key? key,
    required this.mealItemsDetail,
  }) : super(key: key);

  final MealModel mealItemsDetail;

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final isFavorite =
        ref.watch(favoriteMeals).contains(widget.mealItemsDetail);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.mealItemsDetail.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favoriteMeals.notifier)
                  .handlerFavorite(widget.mealItemsDetail);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isAdded
                        ? "Meal added as favorite!"
                        : "Meals is no longer favorite!",
                  ),
                  action: SnackBarAction(
                    label: "Okay",
                    onPressed: () {},
                  ),
                  duration: const Duration(
                    seconds: 3,
                  ),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : null,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.mealItemsDetail.id,
              child: Image.network(widget.mealItemsDetail.imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            ...widget.mealItemsDetail.ingredients.map(
              (ing) => Text(
                ing,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ...widget.mealItemsDetail.steps.asMap().entries.map(
                      (ing) => Text(
                        '${ing.key + 1}. ${ing.value}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
