import 'package:flutter/material.dart';

double iconSize = 25;

TextStyle topTitleStyle(bool isLight) {
  return TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: isLight ? Colors.black : Colors.white,
  );
}

TextStyle topButtonStyle(bool isLight) {
  return TextStyle(
    fontSize: 18,
    color: isLight ? Colors.black : Colors.white,
  );
}

TextStyle bodyTitleStyle(bool isLight) {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: isLight ? Colors.black : Colors.white,
  );
}
