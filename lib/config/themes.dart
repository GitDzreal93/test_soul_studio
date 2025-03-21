import 'package:flutter/material.dart';

class AppTheme {
  // 共享颜色
  static const primaryColor = Color(0xFF40916C);
  static const primaryDarkColor = Color(0xFF2D6A4F);
  static const primaryLightColor = Color(0xFF52B788);
  static const errorColor = Color(0xFFE63946);
  static const successColor = Color(0xFF40916C);
  static const warningColor = Color(0xFFFFAA00);
  static const infoColor = Color(0xFF457B9D);

  // 辅助色
  static const Color lightGreen = Color(0xFFD8F3DC);
  static const Color mediumLightGreen = Color(0xFFB7E4C7);
  static const Color mediumGreen = Color(0xFF95D5B2);
  static const Color darkGreen = Color(0xFF74C69D);

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

  // 暗色主题
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1A1B1E),
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: primaryLightColor,
      surface: Color(0xFF1A202C),
      background: Color(0xFF1A1B1E),
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),
    cardColor: const Color(0xFF1A202C),
    dividerColor: Colors.white12,
    iconTheme: const IconThemeData(
      color: Colors.white70,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white70),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      bodySmall: TextStyle(color: Colors.white60),
    ),
  );

  // 亮色主题
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: primaryLightColor,
      surface: Colors.white,
      background: Color(0xFFF8F9FA),
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF1A202C),
      onBackground: Color(0xFF1A202C),
    ),
    cardColor: Colors.white,
    dividerColor: Colors.black12,
    iconTheme: const IconThemeData(
      color: Color(0xFF1A202C),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF1A202C)),
      titleMedium: TextStyle(color: Color(0xFF1A202C)),
      titleSmall: TextStyle(color: Color(0xFF4A5568)),
      bodyLarge: TextStyle(color: Color(0xFF1A202C)),
      bodyMedium: TextStyle(color: Color(0xFF4A5568)),
      bodySmall: TextStyle(color: Color(0xFF718096)),
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