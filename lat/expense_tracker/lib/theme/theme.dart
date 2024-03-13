import 'package:flutter/material.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(55, 163, 75, 235));
final myTheme = ThemeData().copyWith(
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer,
    ));
