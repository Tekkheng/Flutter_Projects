import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_items_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItems extends StatelessWidget {
  const MealItems({super.key, required this.meal, required this.toMealsDetail});
  final MealModel meal;
  final void Function() toMealsDetail;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: toMealsDetail,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                color: Colors.black45,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        meal.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemsTrait(
                          label: meal.duration.toString(),
                          icon: Icons.schedule,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MealItemsTrait(
                          label: complexityText,
                          icon: Icons.work,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MealItemsTrait(
                          label: affordabilityText,
                          icon: Icons.attach_money,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
