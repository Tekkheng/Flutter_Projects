import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    final currentFilter = ref.watch(filtersMeals);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: const Text('Set Vegan'),
            value: currentFilter[Filters.isVegan]!,
            onChanged: (value) {
              ref
                  .read(filtersMeals.notifier)
                  .setFilters(Filters.isVegan, value);
            },
            activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          SwitchListTile(
            title: const Text('Gluten'),
            subtitle: const Text('Set Gluten'),
            value: currentFilter[Filters.isGlutenFree]!,
            onChanged: (value) {
              ref
                  .read(filtersMeals.notifier)
                  .setFilters(Filters.isGlutenFree, value);
            },
            activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          SwitchListTile(
            title: const Text('Lactose'),
            subtitle: const Text('Set Lactose'),
            value: currentFilter[Filters.isLactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filtersMeals.notifier)
                  .setFilters(Filters.isLactoseFree, value);
            },
            activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: const Text('Set Vegetarian'),
            value: currentFilter[Filters.isVegetarian]!,
            onChanged: (value) {
              ref
                  .read(filtersMeals.notifier)
                  .setFilters(Filters.isVegetarian, value);
            },
            activeColor: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ],
      ),
    );
  }
}
