import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals.dart';

enum Filters {
  isVegan,
  isLactoseFree,
  isGlutenFree,
  isVegetarian;
}

class FilterStateNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterStateNotifier()
      : super({
          Filters.isGlutenFree: false,
          Filters.isLactoseFree: false,
          Filters.isVegetarian: false,
          Filters.isVegan: false,
        });

  void setFilters(Filters filter, bool isChecked) {
    state = {
      ...state,
      filter: isChecked,
    };
  }
}

final filtersMeals =
    StateNotifierProvider<FilterStateNotifier, Map<Filters, bool>>(
        (ref) => FilterStateNotifier());

final mealsFiltersData = Provider((ref) {
  final dataFilters = ref.watch(filtersMeals);
  final dataMeals = ref.watch(meals);
  return dataMeals.where(
    (food) {
      if (!food.isGlutenFree && dataFilters[Filters.isGlutenFree]!) {
        return false;
      }
      if (!food.isLactoseFree && dataFilters[Filters.isLactoseFree]!) {
        return false;
      }
      if (!food.isVegetarian && dataFilters[Filters.isVegetarian]!) {
        return false;
      }
      if (!food.isVegan && dataFilters[Filters.isVegan]!) {
        return false;
      }
      return true;
    },
  ).toList();
});
