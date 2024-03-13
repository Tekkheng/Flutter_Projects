import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorSeed = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(29, 88, 102, 123),
);
final myTheme = ThemeData().copyWith(
  colorScheme: kColorSeed,
  textTheme: GoogleFonts.latoTextTheme(),
);

// darkthem
final kDarkColorSeed = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(29, 88, 102, 123),
);
final myDarkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorSeed,
  textTheme: GoogleFonts.latoTextTheme(),
);
