import 'package:flutter/material.dart';
import 'package:foodwiki_app/models/food_models.dart';
import 'package:foodwiki_app/screens/food_detail_screen.dart';
import 'package:foodwiki_app/widgets/food_item.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key, this.title, required this.food, required this.toggleFavoriteFood});
  final String? title;
  final List food;
  final void Function(FoodModel) toggleFavoriteFood;

  void _goTofoodDetail(BuildContext context, FoodModel food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => FoodDetailScreen(food: food, toggleFavoriteFood: toggleFavoriteFood),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget foodWidget = ListView.builder(
      itemCount: food.length,
      itemBuilder: (ctx, index) => FoodItem(
        food: food[index],
        tofoodDetailScreen: () {
          _goTofoodDetail(
            context,
            food[index],
          );
        },
      ),
    );
    if (title == null) {
      return foodWidget;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: foodWidget,
    );
  }
}
