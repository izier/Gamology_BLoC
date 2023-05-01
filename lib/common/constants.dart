import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  static const Color primaryColor = Color(0xFF1E1E1E);
  static const Color accentColor = Colors.white;
  static const Color scaffoldBackgroundColor = Color(0xFF121212);
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color dividerColor = Color(0xFF707070);
  static const Color textColor = Colors.white;
  static const Color subtitleColor = Colors.grey;
  static const Color buttonColor = Color(0xFF3F3F3F);

  static TextStyle logo = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: subtitleColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 10,
    color: textColor,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 10,
    color: subtitleColor,
  );

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: buttonColor,
    labelStyle: TextStyle(color: textColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: accentColor),
    ),
  );

  static final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    cardColor: cardColor,
    dividerColor: dividerColor,
    inputDecorationTheme: inputDecorationTheme,
  );
}