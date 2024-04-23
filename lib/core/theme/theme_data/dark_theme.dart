import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/theme/colors/dark_colors.dart';

class DarkTheme {
  static final value = ThemeData(
    primaryColor: AppDarkColors.primaryColor,
    scaffoldBackgroundColor: AppDarkColors.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppDarkColors.primaryColor,
      titleTextStyle: TextStyle(
        color: AppDarkColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppDarkColors.textColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppDarkColors.primaryColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: AppDarkColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    hintColor: AppDarkColors.textColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: AppDarkColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppDarkColors.textColor,
        fontSize: 16,
      ),
    ),
  );
}
