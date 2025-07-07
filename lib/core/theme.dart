// lib/core/theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6A1B9A); // بنفش عمیق
  static const Color accentColor = Color(0xFF7B1FA2);  // بنفش روشن‌تر
  static const Color backgroundColor = Color(0xFFF3E5F5); // پس‌زمینه یاسی
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF4A4A4A);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme( // ✅ FIX: Added 'const'
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle( // Note: GoogleFonts can't be const, so TextStyle is used here.
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardThemeData( // ✅ FIX: Changed CardTheme to CardThemeData
        elevation: 4,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16), // Added const
        ),
      ),
      textTheme: TextTheme( // ✅ FIX: Added 'const' where possible inside
        displayLarge: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
        bodyLarge: GoogleFonts.lato(fontSize: 16, color: textColor),
      ),
    );
  }
}