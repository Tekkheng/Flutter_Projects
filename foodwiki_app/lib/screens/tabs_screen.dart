import 'package:flutter/material.dart';
import 'package:foodwiki_app/data/datafood.dart';
import 'package:foodwiki_app/models/food_models.dart';
import 'package:foodwiki_app/screens/category_screen.dart';
import 'package:foodwiki_app/screens/filter_screen.dart';
import 'package:foodwiki_app/screens/food_screen.dart';
import 'package:foodwiki_app/widgets/filter_items.dart';
import 'package:foodwiki_app/widgets/side_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosaFree: false,
  Filter.vegetarianFree: false,
  Filter.veganFree: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  Map<Filter, bool> _selectedFilters = kInitialFilters;
  int pageIndex = 0;
  String pageTitle = "Categories";
  void changePage(index) {
    setState(() {
      pageIndex = index;
    });
  }

  List<FoodModel> favoriteFoods = [];
  void toggleFavoriteFood(FoodModel food) {
    final isExisting = favoriteFoods.contains(food);
    if (isExisting) {
      setState(() {
        favoriteFoods.remove(food);
      });
      _showInfoMessage("Meal is no longer a favorite.");
    } else {
      setState(() {
        favoriteFoods.add(food);
      });
      _showInfoMessage("Marked as a favorite!");
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: "Okay",
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 3,
        ),
      ),
    );
  }

  void setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == "filter") {
      final myFilteredData = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFilters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = myFilteredData ?? kInitialFilters;
      });
      // print(myFilteredData);
    }
  }

  // alternatif pushReplacement menimpa screen sekarang dengan screen baru,
  // void setScreen(String identifier) {
  //   Navigator.pop(context);
  //   if (identifier == "filter") {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (ctx) => const FilterScreen(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final availableFoods = dataFood.where(
      (food) {
        if (!food.isGlutenFree && _selectedFilters[Filter.glutenFree]!) {
          return false;
        }
        if (!food.isLactoseFree && _selectedFilters[Filter.lactosaFree]!) {
          return false;
        }
        if (!food.isVegetarian && _selectedFilters[Filter.vegetarianFree]!) {
          return false;
        }
        if (!food.isVegan && _selectedFilters[Filter.veganFree]!) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget myPage = FoodCategoryScreens(
      toggleFavoriteFood: toggleFavoriteFood,
      availableFoods: availableFoods,
    );
    if (pageIndex == 1) {
      myPage = FoodScreen(
          toggleFavoriteFood: toggleFavoriteFood, food: favoriteFoods);
      pageTitle = "Favorites";
    } else {
      pageTitle = "Categories";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      drawer: SideDrawer(
        setScreen: setScreen,
      ),
      body: myPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Favorites",
          ),
        ],
        currentIndex: pageIndex,
      ),
    );
  }
}
