import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorite.dart';
import 'package:meals_app/providers/filters.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/sidebar.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  void setScreen(String identifier) {
    Navigator.pop(context);
    if (identifier == "filters") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  int indexScreen = 0;
  void navigateScreen(int index) {
    setState(() {
      indexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dataMealsProvider = ref.watch(meals);
    // final availableFoods = dataMealsProvider.where(
    //   (food) {
    //     if (!food.isGlutenFree && myDataFilters[Filters.isGlutenFree]!) {
    //       return false;
    //     }
    //     if (!food.isLactoseFree && myDataFilters[Filters.isLactoseFree]!) {
    //       return false;
    //     }
    //     if (!food.isVegetarian && myDataFilters[Filters.isVegetarian]!) {
    //       return false;
    //     }
    //     if (!food.isVegan && myDataFilters[Filters.isVegan]!) {
    //       return false;
    //     }
    //     return true;
    //   },
    // ).toList();
    final myfavoriteMeals = ref.watch(favoriteMeals);
    final availableMeals = ref.watch(mealsFiltersData);

    Widget currentScreen = CategoryScreen(availableMeals: availableMeals);
    String titleApp = "Category";
    if (indexScreen == 1) {
      currentScreen = MealsScreen(
        mealItems: myfavoriteMeals,
      );
      titleApp = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(titleApp)),
      ),
      drawer: SideBar(setScreen: setScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        onTap: (index) {
          navigateScreen(index);
        },
      ),
      body: currentScreen,
    );
  }
}
