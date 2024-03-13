import 'package:flutter/material.dart';
import 'package:foodwiki_app/screens/tabs_screen.dart';
import 'package:foodwiki_app/theme/my_dark_theme.dart';
import 'package:foodwiki_app/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      darkTheme: myDarkTheme,
      title: 'myFoodApp',
      home: const TabsScreen(),
    );
  }
}
