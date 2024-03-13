import 'package:expense_tracker_app/screens/expense_tracker.dart';
import 'package:expense_tracker_app/theme/dark_theme.dart';
import 'package:expense_tracker_app/theme/theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// untuk membuat app tetap lurus keatas walaupun hp di rotate
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]).then((value) => runApp(const MyApp()));
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: myDarkTheme,
      theme: myTheme,
      // themeMode: ThemeMode.system, // default menyesuaikan dengan mode di setting hp
      title: 'Expense Tracker App',
      home: const ExpenseTracker(),
    );
  }
}
