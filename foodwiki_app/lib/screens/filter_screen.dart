import 'package:flutter/material.dart';
import 'package:foodwiki_app/widgets/filter_items.dart';

// import 'package:foodwiki_app/screens/tabs_screen.dart';
// import 'package:foodwiki_app/widgets/side_drawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Screen"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilterItems(currentFilters: currentFilters),
          )
        ],
      ),

      // drawer: SideDrawer(
      //   setScreen: (identifier) {
      //     Navigator.pop(context);
      //     if (identifier == "meals") {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx) => const TabsScreen()),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
