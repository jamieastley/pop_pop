import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_pop_sample/core/ui/app_colors.dart';

class AppTheme {
  static final _fontFamily = GoogleFonts.fredokaOne().fontFamily;

  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.all(24)),
      side: MaterialStateProperty.resolveWith(
        (states) => const BorderSide(
          color: AppColors.bubbleBlue,
          width: 2,
        ),
      ),
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return TextStyle(
            fontSize: 24,
            fontFamily: _fontFamily,
          );
        },
      ),
    ),
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.all(16)),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith((states) {
          return TextStyle(
            fontSize: 24,
            fontFamily: _fontFamily,
          );
        })),
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    backgroundColor: AppColors.lightBackground,
    dividerColor: Colors.white54,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightThemePrimary,
      secondary: AppColors.lightThemeSecondary,
    ),
    elevatedButtonTheme: _elevatedButtonTheme,
    fontFamily: GoogleFonts.fredokaOne().fontFamily,
    outlinedButtonTheme: _outlinedButtonTheme,
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.dark,
    backgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkThemePrimary,
      secondary: AppColors.darkThemeSecondary,
    ),
    dividerColor: Colors.black12,
    scaffoldBackgroundColor: AppColors.darkBackground,
    elevatedButtonTheme: _elevatedButtonTheme,
    fontFamily: GoogleFonts.fredokaOne().fontFamily,
    outlinedButtonTheme: _outlinedButtonTheme,
  );
}
