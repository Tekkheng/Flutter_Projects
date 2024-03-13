import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(11, 222, 31, 56),
);

final myTheme = ThemeData().copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.primaryContainer,
  ),
  colorScheme: kColorScheme,
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 147, 229, 250),
  surface: const Color.fromARGB(255, 42, 51, 59),
);

final myDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkColorScheme.primaryContainer,
  ),
  colorScheme: kDarkColorScheme,
  scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
);
