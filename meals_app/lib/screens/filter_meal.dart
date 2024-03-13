// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/provider/filter_provider.dart';

// class FilterMealScreen extends ConsumerStatefulWidget {
//   const FilterMealScreen({super.key});
//   @override
//   ConsumerState<FilterMealScreen> createState() {
//     return _FilterMealScreen();
//   }
// }

// class _FilterMealScreen extends ConsumerState<FilterMealScreen> {
//   bool _isGlutenFree = false;
//   bool _isLactoseFree = false;
//   bool _isVegetarianFree = false;
//   bool _isVeganFree = false;

//   @override
//   void initState() {
//     final activeFilter = ref.read(filtersProvider);
//     _isGlutenFree = activeFilter[Filters.isGluten]!;
//     _isLactoseFree = activeFilter[Filters.isLactose]!;
//     _isVegetarianFree = activeFilter[Filters.isVegetarian]!;
//     _isVeganFree = activeFilter[Filters.isVegan]!;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Your Filters",
//           style: Theme.of(context)
//               .textTheme
//               .titleLarge!
//               .copyWith(color: Theme.of(context).colorScheme.onBackground),
//         ),
//       ),
//       body: PopScope(
//         canPop: true,
//         onPopInvoked: (pop) async {
//           ref.read(filtersProvider.notifier).setfilters({
//             Filters.isGluten: _isGlutenFree,
//             Filters.isLactose: _isLactoseFree,
//             Filters.isVegetarian: _isVegetarianFree,
//             Filters.isVegan: _isVeganFree,
//           });
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               value: _isGlutenFree,
//               onChanged: (isChecked) => setState(() {
//                 _isGlutenFree = isChecked;
//               }),
//               title: Text(
//                 "Gluten Free",
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 "Free Gluten, asdjksadjask daskd",
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//             ),
//             SwitchListTile(
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               value: _isLactoseFree,
//               onChanged: (isChecked) => setState(() {
//                 _isLactoseFree = isChecked;
//               }),
//               title: Text(
//                 "Lactose Free",
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 "Free Lactose, asdjksadjask daskd",
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//             ),
//             SwitchListTile(
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               value: _isVegetarianFree,
//               onChanged: (isChecked) => setState(() {
//                 _isVegetarianFree = isChecked;
//               }),
//               title: Text(
//                 "Vegetarian Free",
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 "Free Vegetarian, asdjksadjask daskd",
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//             ),
//             SwitchListTile(
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               value: _isVeganFree,
//               onChanged: (isChecked) => setState(() {
//                 _isVeganFree = isChecked;
//               }),
//               title: const Text("Vegan Free"),
//               subtitle: const Text("Free Vegan, asdjksadjask daskd"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filter_provider.dart';

class FilterMealScreen extends ConsumerWidget {
  const FilterMealScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Filters",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isGluten]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setfilter(Filters.isGluten, isChecked),
            title: Text(
              "Gluten Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Free Gluten, asdjksadjask daskd",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isLactose]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setfilter(Filters.isLactose, isChecked),
            title: Text(
              "Lactose Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Free Lactose, asdjksadjask daskd",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isVegetarian]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setfilter(Filters.isVegetarian, isChecked),
            title: Text(
              "Vegetarian Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Free Vegetarian, asdjksadjask daskd",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filters.isVegan]!,
            onChanged: (isChecked) => ref
                .read(filtersProvider.notifier)
                .setfilter(Filters.isVegan, isChecked),
            title: const Text("Vegan Free"),
            subtitle: const Text("Free Vegan, asdjksadjask daskd"),
          ),
        ],
      ),
    );
  }
}
