import 'package:flutter/material.dart';

double topIconSize = 25;
double bodyIconSize = 15;

TextStyle topTitleStyle(bool isLight) {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: isLight ? Colors.black : Colors.white,
  );
}

TextStyle topButtonStyle(bool isLight) {
  return TextStyle(
    fontSize: 16,
    color: isLight ? Colors.black : Colors.white,
  );
}

TextStyle bodyTitleStyle(bool isLight) {
  return TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: isLight ? Colors.black : Colors.white,
  );
}

TextStyle bodyContentStyle(bool isLight) {
  return TextStyle(
    fontSize: 16,
    color: isLight ? Colors.black : Colors.white,
  );
}
