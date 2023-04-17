import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: GoogleFonts.openSans(
      color: Colors.black87,
    ),
    bodyLarge: GoogleFonts.openSans(
      color: Colors.black54,
      fontSize: 24,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: GoogleFonts.openSans(
      color: Colors.white70,
    ),
    bodyLarge: GoogleFonts.openSans(
      color: Colors.white60,
      fontSize: 24,
    ),
  );
}
