import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/theme/colors/light_colors.dart';

class LightTheme {
  static final value = ThemeData(
    primaryColor: AppLightColors.primaryColor,
    scaffoldBackgroundColor: AppLightColors.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppLightColors.primaryColor,
      titleTextStyle: TextStyle(
        color: AppLightColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppLightColors.primaryColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: AppLightColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppLightColors.textColor,
    ),
    hintColor: AppLightColors.textColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: AppLightColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppLightColors.textColor,
        fontSize: 16,
      ),
    ),
  );
}
