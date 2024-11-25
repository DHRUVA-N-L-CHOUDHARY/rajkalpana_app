import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xff042F40); // Red
  static const Color primaryLight = Color(0xFFFFEBEE);
  static const Color primaryDark = Color(0xff042F40);

  // Secondary Colors
  static const Color secondary = Color(0xff042F40); // Green
  static const Color secondaryLight = Color(0xff042F40);
  static const Color secondaryDark = Color(0xff042F40);

  // Background Colors
  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = Colors.black;

  // Text Colors
  static const Color textLight = Colors.black;
  static const Color textDark = Colors.white;

  // Accent Colors
  static const Color accent = Color(0xFFFFC107); // Amber

  static const Color iconLight = Color.fromARGB(255, 255, 255, 255); // Light theme icon color
  static const Color iconDark = Color(0xff042F40);
}

MaterialColor createMaterialColor(Color color) {
  Map<int, Color> colorSwatch = {
    50: Color.alphaBlend(Colors.white.withOpacity(0.9), color),
    100: Color.alphaBlend(Colors.white.withOpacity(0.8), color),
    200: Color.alphaBlend(Colors.white.withOpacity(0.6), color),
    300: Color.alphaBlend(Colors.white.withOpacity(0.4), color),
    400: Color.alphaBlend(Colors.white.withOpacity(0.2), color),
    500: color,
    600: Color.alphaBlend(Colors.black.withOpacity(0.1), color),
    700: Color.alphaBlend(Colors.black.withOpacity(0.2), color),
    800: Color.alphaBlend(Colors.black.withOpacity(0.3), color),
    900: Color.alphaBlend(Colors.black.withOpacity(0.4), color),
  };
  return MaterialColor(color.value, colorSwatch);
}

final customColor = createMaterialColor(Color.fromARGB(255, 4, 47, 64));
