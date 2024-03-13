import 'package:flutter/material.dart';
// import 'package:foodwiki_app/screens/tabs_screen.dart';
// import 'package:foodwiki_app/widgets/side_drawer.dart';

enum Filter { glutenFree, lactosaFree, vegetarianFree, veganFree }

class FilterItems extends StatefulWidget {
  const FilterItems({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<StatefulWidget> createState() {
    return _FiterItems();
  }
}

class _FiterItems extends State<FilterItems> {
  var _glutenFreeFilterSet = false;
  var _lactosaFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactosaFreeFilterSet = widget.currentFilters[Filter.lactosaFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarianFree]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.veganFree]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // cara dulu
    // return WillPopScope(
    //   onWillPop: () async {
    //     Navigator.of(context).pop({
    //       Filter.glutenFree: _glutenFreeFilterSet,
    //       Filter.lactosaFree: _lactosaFreeFilterSet,
    //       Filter.vegetarianFree: _vegetarianFreeFilterSet,
    //       Filter.veganFree: _veganFreeFilterSet,
    //     });
    //     return false;
    //   },
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        Navigator.of(context).pop({
          Filter.glutenFree: _glutenFreeFilterSet,
          Filter.lactosaFree: _lactosaFreeFilterSet,
          Filter.vegetarianFree: _vegetarianFreeFilterSet,
          Filter.veganFree: _veganFreeFilterSet,
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) => setState(() {
              _glutenFreeFilterSet = isChecked;
            }),
            title: Text(
              "Gluten Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "subtitle for Gluten Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
            value: _lactosaFreeFilterSet,
            onChanged: (isChecked) => setState(() {
              _lactosaFreeFilterSet = isChecked;
            }),
            title: Text(
              "Lactosa Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "subtitle for Lactosa Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
            value: _vegetarianFreeFilterSet,
            onChanged: (isChecked) => setState(() {
              _vegetarianFreeFilterSet = isChecked;
            }),
            title: Text(
              "Vegetarian Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "subtitle for Vegetarian Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
            value: _veganFreeFilterSet,
            onChanged: (isChecked) => setState(() {
              _veganFreeFilterSet = isChecked;
            }),
            title: Text(
              "Vegan Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "subtitle for Vegan Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
