import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meal_provider.dart';

enum Filters { isGluten, isLactose, isVegetarian, isVegan }

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.isGluten: false,
          Filters.isLactose: false,
          Filters.isVegetarian: false,
          Filters.isVegan: false,
        });

  // void setfilters(Map<Filters,bool> chosenFilters) {
  //   state = chosenFilters;
  // }

  void setfilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
  (ref) => FilterNotifier(),
);

final filteredMealProvider = Provider(
  (ref) {
    final meals = ref.watch(mealProvider);
    final activeFilters = ref.watch(filtersProvider);
    return meals.where(
      (meal) {
        if (!meal.isGlutenFree && activeFilters[Filters.isGluten]!) {
          return false;
        }
        if (!meal.isLactoseFree && activeFilters[Filters.isLactose]!) {
          return false;
        }
        if (!meal.isVegetarian && activeFilters[Filters.isVegetarian]!) {
          return false;
        }
        if (!meal.isVegan && activeFilters[Filters.isVegan]!) {
          return false;
        }
        return true;
      },
    ).toList();
  },
);
