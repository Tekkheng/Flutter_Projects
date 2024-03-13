enum Affordability { affordable, pricey, luxurious }
enum Complexity { simple, challenging, hard }

class FoodModel {
  const FoodModel(
      {required this.id,
      required this.categories,
      required this.title,
      required this.affordability,
      required this.complexity,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree});

  final String id, title, imageUrl;
  final int duration;
  final List<String> categories, ingredients, steps;
  final bool isGlutenFree, isVegan, isVegetarian, isLactoseFree;
  final Complexity complexity;
  final Affordability affordability;
}
