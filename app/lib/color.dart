import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData getTheme(isLight) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: isLight ? Colors.white : Colors.black,
      background: isLight ? Colors.white : Colors.black45,
      outline: isLight ? Colors.white : Colors.black,
      outlineVariant: isLight ? Colors.white : Colors.black,
      brightness: isLight ? Brightness.light : Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      color: isLight ? Colors.cyanAccent : Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 13.sp,
        color: isLight ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: isLight ? Colors.black : Colors.white),
      bodyMedium: TextStyle(color: isLight ? Colors.black : Colors.white),
      bodySmall: TextStyle(color: isLight ? Colors.black : Colors.white),
      displayLarge: TextStyle(color: isLight ? Colors.black : Colors.white),
      displayMedium: TextStyle(color: isLight ? Colors.black : Colors.white),
      displaySmall: TextStyle(color: isLight ? Colors.black : Colors.white),
      titleLarge: TextStyle(color: isLight ? Colors.black : Colors.white),
      titleMedium: TextStyle(color: isLight ? Colors.black : Colors.white),
      titleSmall: TextStyle(color: isLight ? Colors.black : Colors.white),
    ),
  );
}
