import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.setScreen});
  final void Function(String) setScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                Icon(Icons.lunch_dining,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                const Spacer(),
                IconButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setScreen("meals");
            },
            title: const Text("Meals"),
            leading: const Icon(Icons.restaurant),
          ),
          ListTile(
            onTap: () {
              setScreen("filter");
            },
            title: const Text("Filter"),
            leading: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
