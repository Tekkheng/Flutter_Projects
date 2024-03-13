import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      darkTheme: myDarkTheme,
      title: "Meals App",
      home: const TabsScreen(),
    );
  }
}
