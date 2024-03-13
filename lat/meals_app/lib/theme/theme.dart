import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(182, 34, 161, 17),
);

final myTheme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(108, 12, 62, 5),
);
final myDarkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);
