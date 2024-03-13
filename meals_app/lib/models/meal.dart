enum Affordability {
  affordable,
  pricey,
  luxurious,
}

enum Complexity {
  simple,
  challenging,
  hard,
}

class MealModel {
  const MealModel(
      {required this.title,
      required this.id,
      required this.categories,
      required this.affordability,
      required this.complexity,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian});
  final String id, title, imageUrl;
  final List categories, steps, ingredients;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;
}
