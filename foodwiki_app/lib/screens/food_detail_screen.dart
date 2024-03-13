import 'package:flutter/material.dart';
import 'package:foodwiki_app/models/food_models.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen(
      {super.key, required this.food, required this.toggleFavoriteFood});
  final FoodModel food;
  final void Function(FoodModel) toggleFavoriteFood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.title),
        actions: [
          IconButton(
            onPressed: () {
              toggleFavoriteFood(food);
            },
            icon: const Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  clipBehavior: Clip.hardEdge,
                  elevation: 2,
                  child: Image.network(
                    food.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Ingredients: ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                ...food.ingredients.map(
                  (ingre) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                      ingre,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Steps: ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                ...food.steps.asMap().entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          "${entry.key + 1}. ${entry.value}}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
