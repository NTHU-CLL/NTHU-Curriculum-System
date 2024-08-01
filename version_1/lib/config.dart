import 'package:flutter/material.dart';

// ##### Setting config
// ### System
// # device threshold
const double mobileThreshold = 850;
const double designWidthMobile = 1080;
const double designWidthDesktop = 1920;

// # Language
const List<Locale> supportedLocales = [
  Locale('zh', 'TW'),
  Locale('en', 'US'),
];

// # Tab name
List<String> tabNames = [
  'tab_search',
  'tab_rule',
  'tab_credit',
  'tab_interdisciplinary',
  'tab_map',
];

// ### UI
// # Light theme
const Color lightBackground = Colors.white;
const Color lightError = Color.fromRGBO(243, 13, 13, 1);
const Color lightPrimary1 = Color.fromRGBO(181, 42, 203, 1);
const Color lightPrimary2 = Color.fromRGBO(60, 195, 38, 1);
const Color lightSecondary = Color.fromRGBO(231, 153, 193, 1);
const Color lightComponent1 = Color.fromRGBO(83, 210, 39, 1);
const Color lightComponent2 = Color.fromRGBO(250, 137, 195, 1);
const Color lightComponent3 = Color.fromRGBO(180, 180, 180, 1);
const Color lightComponent4 = Color.fromRGBO(218, 218, 218, 1);
const Color lightComponent5 = Color.fromRGBO(71, 192, 29, 1);
const Color lightComponent6 = Color.fromRGBO(138, 19, 143, 1);
const Color lightComponent7 = Color.fromRGBO(233, 85, 161, 1);

// # Dark theme
const Color darkBackground = Color.fromRGBO(42, 42, 42, 1);
const Color darkError = Color.fromRGBO(243, 13, 13, 1);
const Color darkPrimary1 = Color.fromRGBO(181, 42, 203, 1);
const Color darkPrimary2 = Color.fromRGBO(60, 195, 38, 1);
const Color darkSecondary = Color.fromRGBO(231, 153, 193, 1);
const Color darkComponent1 = Color.fromRGBO(83, 210, 39, 1);
const Color darkComponent2 = Color.fromRGBO(250, 137, 195, 1);
const Color darkComponent3 = Color.fromRGBO(180, 180, 180, 1);
const Color darkComponent4 = Color.fromRGBO(218, 218, 218, 1);
const Color darkComponent5 = Color.fromRGBO(71, 192, 29, 1);
const Color darkComponent6 = Color.fromRGBO(138, 19, 143, 1);
const Color darkComponent7 = Color.fromRGBO(233, 85, 161, 1);

// # Font
const double fontH2 = 32;
const double fontH3 = 24;
const double fontH4 = 20;
const double fontRegular = 16;

// # Radius
BorderRadius radiusButton = BorderRadius.circular(50);
