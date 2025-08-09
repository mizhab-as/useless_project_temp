import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CyberTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: CyberColors.primary,
    scaffoldBackgroundColor: CyberColors.background,
    colorScheme: const ColorScheme.dark(
      primary: CyberColors.primary,
      secondary: CyberColors.secondary,
      surface: CyberColors.surface,
      background: CyberColors.surface,
    ),
    textTheme: GoogleFonts.orbitronTextTheme().copyWith(
      displayLarge: GoogleFonts.orbitron(
        color: CyberColors.primary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
      bodyLarge: GoogleFonts.rajdhani(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CyberColors.surface.withOpacity(0.5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20, vertical: 18),
      labelStyle: GoogleFonts.rajdhani(
        color: CyberColors.primary,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: CyberColors.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
      color: CyberColors.surface,
    ),
  );
}

class CyberColors {
  static const primary = Color(0xFF00FFE0);
  static const secondary = Color(0xFFFF0090);
  static const surface = Color(0xFF1A1A2E);
  static const background = Color(0xFF0F0F1E);
  static const error = Color(0xFFFF3860);
}