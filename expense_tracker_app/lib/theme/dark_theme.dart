import 'package:flutter/material.dart';

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 249, 155, 158),
  brightness: Brightness.dark,
);

final myDarkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkColorScheme.primaryContainer,
    foregroundColor: kDarkColorScheme.onPrimaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.primaryContainer,
      foregroundColor: kDarkColorScheme.onPrimaryContainer,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kDarkColorScheme.onSecondaryContainer,
    ),
  ),
);
