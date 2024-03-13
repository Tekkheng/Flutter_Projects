import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.setScreen});
  final void Function(String) setScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.lunch_dining_outlined),
                const SizedBox(
                  width: 18,
                ),
                Text("Cooking Up!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer))
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setScreen("meals");
            },
            leading: const Icon(
              Icons.restaurant,
              size: 22,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              setScreen("filters");
            },
            leading: const Icon(
              Icons.settings,
              size: 22,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
