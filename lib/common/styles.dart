import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color.fromARGB(255, 240, 129, 2);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.lobsterTwo(
      fontSize: 91, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.lobsterTwo(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall:
      GoogleFonts.lobsterTwo(fontSize: 45, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.lobsterTwo(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall:
      GoogleFonts.lobsterTwo(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.lobsterTwo(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.lobsterTwo(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.lobsterTwo(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.merriweather(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.merriweather(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.merriweather(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);


