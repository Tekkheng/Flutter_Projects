import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_items_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealItems, required this.route});
  final MealModel mealItems;
  final void Function() route;

  String get complexityText {
    return mealItems.complexity.name[0].toUpperCase() +
        mealItems.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealItems.affordability.name[0].toUpperCase() +
        mealItems.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: route,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(bottom:15.0),
        child: Stack(
          children: [
            Hero(
              tag: mealItems.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealItems.imageUrl),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                color: Colors.black45,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mealItems.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemsTrait(
                          label: mealItems.duration.toString(),
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
