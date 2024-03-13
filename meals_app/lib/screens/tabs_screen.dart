import 'package:flutter/material.dart';
// import 'package:meals_app/data/data.dart';
// import 'package:meals_app/models/meal.dart';
// import 'package:meals_app/provider/favorite_meal.dart';

import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/filter_meal.dart';
import 'package:meals_app/screens/meal.dart';
import 'package:meals_app/widgets/drawer.dart';

import 'package:meals_app/provider/favorite_provider.dart';

import 'package:meals_app/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _pageIndex = 0;
  void _selectedScreen(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  // final List<MealModel> favoriteMeals = [];
  // void _toggleFavorite(MealModel meal) {
  //   if (favoriteMeals.contains(meal)) {
  //     setState(() {
  //       favoriteMeals.remove(meal);
  //     });
  //     _showInfoMessage("Meal is no longer a favorite.");
  //   } else {
  //     setState(() {
  //       favoriteMeals.add(meal);
  //     });
  //     _showInfoMessage("Marked as a favorite!");
  //   }
  //   // print(favoriteMeals.length);
  // }

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       action: SnackBarAction(
  //         label: "Okay",
  //         onPressed: () {},
  //       ),
  //       duration: const Duration(
  //         seconds: 3,
  //       ),
  //     ),
  //   );
  // }

  void _setScreen(String identifier) async{
    Navigator.pop(context);
    if (identifier == "filters") {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FilterMealScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealProvider);

    String pageTitle = "Category";
    Widget widgetScreen = CategoryScreen(availableMeals: availableMeals);
    if (_pageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      widgetScreen = MealScreen(meals: favoriteMeals);
      pageTitle = "Favorite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: widgetScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
        currentIndex: _pageIndex,
      ),
      drawer: MainDrawer(
        setScreen: _setScreen,
      ),
    );
  }
}
