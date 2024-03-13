import 'package:flutter/material.dart';
import 'package:shopping/screens/grocery.dart';
import 'package:shopping/theme/theme.dart';

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
      title: 'Shopping',
      home: const Grocery(),
    );
  }
}
