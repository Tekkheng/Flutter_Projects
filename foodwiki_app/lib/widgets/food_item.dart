import 'package:flutter/material.dart';
import 'package:foodwiki_app/models/food_models.dart';
import 'package:transparent_image/transparent_image.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.food, required this.tofoodDetailScreen});
  final void Function() tofoodDetailScreen;
  final FoodModel food;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: tofoodDetailScreen,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(food.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                color: Colors.black54,
                child: Text(
                  food.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
