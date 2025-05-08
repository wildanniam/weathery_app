import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors
  static const Color _lightPrimaryColor = Color(0xFF0D47A1);
  static const Color _lightAccentColor = Color(0xFFFFC107);
  static const Color _lightBackgroundColor = Color(0xFFF5F7FA);
  static const Color _lightPrimaryTextColor = Color(0xFF212121);
  static const Color _lightSecondaryTextColor = Color(0xFF757575);

  // Dark Theme Colors
  static const Color _darkPrimaryColor = Color(0xFF1565C0);
  static const Color _darkAccentColor = Color(0xFFFFD54F);
  static const Color _darkBackgroundColor = Color(0xFF121212);
  static const Color _darkPrimaryTextColor = Color(0xFFE0E0E0);
  static const Color _darkSecondaryTextColor = Color(0xFFBDBDBD);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        secondary: _lightAccentColor,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: _lightPrimaryTextColor,
        onSurface: _lightPrimaryTextColor,
      ),
      scaffoldBackgroundColor: _lightBackgroundColor,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: _lightPrimaryTextColor,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: _lightPrimaryTextColor,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: _lightPrimaryTextColor,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _lightPrimaryTextColor,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: _lightPrimaryTextColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: _lightPrimaryTextColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          color: _lightSecondaryTextColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _lightPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightPrimaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _darkAccentColor,
        surface: Color(0xFF1E1E1E),
        onPrimary: Colors.white,
        onSecondary: _darkPrimaryTextColor,
        onSurface: _darkPrimaryTextColor,
      ),
      scaffoldBackgroundColor: _darkBackgroundColor,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: _darkPrimaryTextColor,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: _darkPrimaryTextColor,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: _darkPrimaryTextColor,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _darkPrimaryTextColor,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: _darkPrimaryTextColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: _darkPrimaryTextColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          color: _darkSecondaryTextColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _darkBackgroundColor,
        foregroundColor: _darkPrimaryTextColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _darkPrimaryTextColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkPrimaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: const CardThemeData(
        color: Color(0xFF1E1E1E),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
