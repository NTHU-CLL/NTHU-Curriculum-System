import 'package:flutter/material.dart';

ThemeData getTheme(isLight) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: isLight ? Colors.white : Colors.black,
      background: isLight ? Colors.white : Colors.black54,
      brightness: isLight ? Brightness.light : Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      color: isLight ? Colors.cyanAccent : Colors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: isLight ? Colors.black : Colors.white,
      ),
    ),
  );
}
