import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorDarkScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(140, 142, 125, 31),
    brightness: Brightness.dark);

final myDarkTheme = ThemeData.dark().copyWith(
  colorScheme: kColorDarkScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);
