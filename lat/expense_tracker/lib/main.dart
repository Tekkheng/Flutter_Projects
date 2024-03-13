import 'package:expense_tracker/screens/expense_tracker.dart';
import 'package:expense_tracker/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'expense_app',
      theme: myTheme,
      home: const ExpenseTracker()
    );
  }
}
