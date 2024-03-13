import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(55, 194, 11, 222),
);
final myTheme = ThemeData().copyWith(
  colorScheme: kColorScheme,
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(55, 31, 3, 71),
);
final myDarkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme:
      const AppBarTheme().copyWith(backgroundColor: kColorScheme.onPrimaryContainer),
);
