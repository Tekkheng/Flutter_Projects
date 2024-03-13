import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(129, 222, 136, 43));

final myTheme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
