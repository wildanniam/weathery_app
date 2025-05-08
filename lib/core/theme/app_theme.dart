import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors
  static const Color _lightPrimaryColor = Color(0xFF0D47A1);
  // static const Color _lightBackgroundColor = Color(0xFFF5F7FA);
  static const Color _lightPrimaryTextColor = Color(0xFF212121);
  static const Color _lightSecondaryTextColor = Color(0xFF757575);

  // Dark Theme Colors
  // static const Color _darkPrimaryColor = Color(0xFF1565C0);
  // static const Color _darkBackgroundColor = Color(0xFF0A1929);
  // static const Color _darkSurfaceColor = Color(0xFF132F4C);
  // static const Color _darkPrimaryTextColor = Color(0xFFE0E0E0);
  // static const Color _darkSecondaryTextColor = Color(0xFFBDBDBD);
  // static const Color _darkAccentColor = Color(0xFF64B5F6);

  // Night Sky Gradients
  static const LinearGradient _nightSkyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0A1929), // Dark blue at top
      Color(0xFF1A237E), // Deep blue in middle
      Color(0xFF0D47A1), // Lighter blue at bottom
    ],
  );

  static const LinearGradient _moonlightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF64B5F6), // Light blue
      Color(0xFF90CAF9), // Lighter blue
    ],
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2196F3),
        secondary: Color(0xFF64B5F6),
        surface: Colors.white,
        onSurface: Colors.black87,
        error: Color(0xFFD32F2F),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      shadowColor: Colors.black.withAlpha(13),
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
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
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
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF64B5F6),
        secondary: Color(0xFF90CAF9),
        surface: Color(0xFF132F4C),
        onSurface: Color(0xFFE0E0E0),
        error: Color(0xFFEF5350),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF0A1929),
      cardColor: const Color(0xFF132F4C),
      shadowColor: Colors.black.withAlpha(51),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF90CAF9),
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF90CAF9),
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF90CAF9),
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF90CAF9),
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: const Color(0xFF90CAF9),
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xFF90CAF9),
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          color: const Color(0xFF64B5F6).withAlpha(179),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: const Color(0xFF90CAF9),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF90CAF9),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF90CAF9),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF64B5F6),
          foregroundColor: const Color(0xFF0A1929),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A237E),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: const Color(0xFF64B5F6).withAlpha(51),
      ),
      extensions: [
        CustomColors(
          backgroundGradient: _nightSkyGradient,
          cardGradient: _moonlightGradient,
        ),
      ],
    );
  }
}

class CustomColors extends ThemeExtension<CustomColors> {
  final LinearGradient backgroundGradient;
  final LinearGradient cardGradient;

  CustomColors({
    required this.backgroundGradient,
    required this.cardGradient,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    LinearGradient? backgroundGradient,
    LinearGradient? cardGradient,
  }) {
    return CustomColors(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      cardGradient: cardGradient ?? this.cardGradient,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      backgroundGradient: backgroundGradient,
      cardGradient: cardGradient,
    );
  }
}
