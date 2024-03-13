import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(244, 213, 80, 84),
);

final myTheme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  // scaffoldBackgroundColor: const Color.fromARGB(255, 192, 235, 255),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.secondaryContainer.withOpacity(0.6),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: kColorScheme.onPrimaryContainer,
        ),
      ),
);
