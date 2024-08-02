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

// # Dark theme
const Color darkBackground = Color.fromRGBO(42, 42, 42, 1);

// # Shared
const Color colorError = Color.fromRGBO(243, 13, 13, 1);
const Color colorPrimary1 = Color.fromRGBO(181, 42, 203, 1);
const Color colorPrimary2 = Color.fromRGBO(60, 195, 38, 1);
const Color colorSecondary = Color.fromRGBO(231, 153, 193, 1);
const Color colorComponent1 = Color.fromRGBO(83, 210, 39, 1);
const Color colorComponent2 = Color.fromRGBO(250, 137, 195, 1);
const Color colorComponent3 = Color.fromRGBO(180, 180, 180, 1);
const Color colorComponent4 = Color.fromRGBO(218, 218, 218, 1);
const Color colorComponent5 = Color.fromRGBO(71, 192, 29, 1);
const Color colorComponent6 = Color.fromRGBO(138, 19, 143, 1);
const Color colorComponent7 = Color.fromRGBO(233, 85, 161, 1);

// # Font
const double fontP = 18;
const double fontH2 = 32;
const double fontH3 = 24;
const double fontH4 = 20;
const double fontRegular = 16;
const double fontMobileLarge = 18;
const double fontMobileRegular = 16;

// # Radius
BorderRadius radiusMenu = BorderRadius.circular(20);
BorderRadius radiusButton = BorderRadius.circular(50);

// # Time
List<String> dayCodes = ["M", "T", "W", "R", "F", "S"];
List<String> courseCodes = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c"];
