import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.setScreen});

  final void Function(String) setScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.yellow],
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.lunch_dining_rounded),
                SizedBox(
                  width: 20,
                ),
                Text('JUDUL'),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  setScreen("filters");
                },
                title: const Text('Filters'),
                leading: const Icon(
                  Icons.filter_tilt_shift,
                ),
              ),
              ListTile(
                onTap: () {
                  setScreen("meals");
                },
                title: const Text('Meals'),
                leading: const Icon(
                  Icons.food_bank_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
