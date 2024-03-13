import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsNotifier() : super([]);

  bool handlerFavorite(MealModel newMeal) {
    if (state.contains(newMeal)) {
      state = state.where((m) => m.id != newMeal.id).toList();
      return false;
    } else {
      state = [...state, newMeal];
      return true;
    }
  }
}

final favoriteMeals =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealModel>>(
        (ref) => FavoriteMealsNotifier());
