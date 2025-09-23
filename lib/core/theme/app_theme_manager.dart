import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorPallete.scaffoldBackgroundColor,
    ),
    scaffoldBackgroundColor: ColorPallete.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorPallete.primaryColor),
      titleTextStyle: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w500,
        fontSize: 22,
        color: ColorPallete.primaryColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPallete.primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorPallete.darkScaffoldBackgroundColor,
  );
}
