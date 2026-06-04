import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // App Colors
  static const Color primary = Color(0xFFb85c2a);
  static const Color primary2 = Color(0xFFd4763e);
  static const Color secondary = Color(0xFF2c4a3e);
  static const Color accent = Color(0xFFf0c060);
  
  static const Color background = Color(0xFFfaf8f5);
  static const Color card = Color(0xFFffffff);
  
  static const Color text = Color(0xFF1a1208);
  static const Color gray = Color(0xFF7a6f65);
  static const Color light = Color(0xFFf0ebe3);
  static const Color border = Color(0xFFe8e0d5);

  // Status Colors
  static const Color success = Color(0xFF1a8a52);
  static const Color successBg = Color(0xFFe3f9ee);
  static const Color warning = Color(0xFFd4600a);
  static const Color warningBg = Color(0xFFfff3e0);
  static const Color error = Color(0xFFc0392b);
  static const Color errorBg = Color(0xFFffe8e8);
  static const Color info = Color(0xFF2b5fc0);
  static const Color infoBg = Color(0xFFe8f0ff);

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: card,
        error: error,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.dmSansTextTheme().copyWith(
        displayLarge: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        headlineSmall: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        titleSmall: GoogleFonts.fraunces(color: text, fontWeight: FontWeight.bold),
        bodyLarge: GoogleFonts.dmSans(color: text),
        bodyMedium: GoogleFonts.dmSans(color: text),
        bodySmall: GoogleFonts.dmSans(color: gray),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: text,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.fraunces(
          color: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.dmSans(fontSize: 15, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 4,
          shadowColor: primary.withAlpha(128),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: GoogleFonts.dmSans(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: border, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: border, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
        hintStyle: GoogleFonts.dmSans(color: gray, fontSize: 14),
      ),
    );
  }
}
