import 'package:flutter/material.dart';

class AppTheme {
  // 主色调
  static const Color primaryColor = Color(0xFF40916C);
  static const Color primaryLightColor = Color(0xFF52B788);
  static const Color primaryDarkColor = Color(0xFF081C15);

  // 辅助色
  static const Color lightGreen = Color(0xFFD8F3DC);
  static const Color mediumLightGreen = Color(0xFFB7E4C7);
  static const Color mediumGreen = Color(0xFF95D5B2);
  static const Color darkGreen = Color(0xFF74C69D);

  // 功能色
  static const Color successColor = Color(0xFF40916C);
  static const Color errorColor = Color(0xFFE63946);
  static const Color warningColor = Color(0xFFFFAA00);
  static const Color infoColor = Color(0xFF457B9D);

  // 中性色
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color dividerColor = Color(0xFFE9ECEF);
  static const Color textPrimaryColor = Color(0xFF212529);
  static const Color textSecondaryColor = Color(0xFF6C757D);
  static const Color textDisabledColor = Color(0xFFADB5BD);

  // 阴影
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];

  // 圆角
  static const double cardRadius = 8.0;
  static const double buttonRadius = 4.0;

  // 边距
  static const double contentPadding = 16.0;
  static const double cardPadding = 16.0;

  // 主题数据
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    dividerColor: dividerColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: primaryLightColor,
      error: errorColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: textPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: textPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: textPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: textPrimaryColor,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: textSecondaryColor,
        fontSize: 14,
      ),
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    ),
  );
} 