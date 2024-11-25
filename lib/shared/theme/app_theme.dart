import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff042F40),
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: customColor,
      brightness: Brightness.light, // Ensure brightness matches
    ).copyWith(surface: Colors.white),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    iconTheme: IconThemeData(
      color: AppColors.iconLight, // Light theme icon color
      size: 24.0, // Default icon size
    ),
    primaryIconTheme: IconThemeData(
      color: Color(0xff042F40), // Primary color for icons
      size: 28.0, // Slightly larger for primary icons
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff042F40),
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: customColor,
      brightness: Brightness.dark, // Ensure brightness matches
    ).copyWith(surface: Colors.black),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    iconTheme: IconThemeData(
      color: AppColors.iconDark, // Dark theme icon color
      size: 24.0, // Default icon size
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white, // Primary color for icons in dark theme
      size: 28.0, // Slightly larger for primary icons
    ),
  );
}
