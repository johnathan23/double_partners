import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light =>
      ThemeData(useMaterial3: true, fontFamily: GoogleFonts.poppins().fontFamily, brightness: Brightness.light, textTheme: _textTheme);

  static TextTheme get _textTheme => const TextTheme(
    labelSmall: TextStyle(fontSize: kSize12, fontWeight: FontWeight.normal),
    labelMedium: TextStyle(fontSize: kSize14, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: kSize16, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(fontSize: kSize18, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: kSize20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: kSize24, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: kSize30, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: kSize34, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(fontSize: kSize40, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(fontSize: kSize12, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: kSize14, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(fontSize: kSize16, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(fontSize: kSize20, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: kSize24, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: kSize28, fontWeight: FontWeight.bold),
  );
}
