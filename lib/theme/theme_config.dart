import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightAccent = const Color(0xff2ca8e2);
  static Color darkAccent = Colors.deepPurple;
  static Color darkSecondaryAccent = Colors.purple;
  static Color lightBG = Colors.white;
  static Color darkBG = const Color(0xff121212);

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: lightPrimary,
      onPrimary: darkAccent,
      secondary: darkSecondaryAccent,
      onSecondary: lightAccent,
      background: darkBG,
    ),
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 0, 86, 166),
      background: lightBG,
    ),
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
}
