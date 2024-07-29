import 'tab/map.dart';
import 'tab/search.dart';
import 'tab/prerequisite.dart';
import 'tab/credit.dart';
import 'tab/interdisciplinary.dart';
import 'package:flutter/material.dart';

// ##### Setting config
// ### Color (Light theme)
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

// ### Color (Dark theme)
const Color darkBackground = Color.fromRGBO(42, 42, 42, 1);
const Color darkError = Color.fromRGBO(243, 13, 13, 1);
const Color darkPrimary1 = Color.fromRGBO(141, 40, 145, 1);
const Color darkPrimary2 = Color.fromRGBO(17, 97, 39, 1);
const Color darkSecondary = Color.fromRGBO(231, 153, 193, 1);

// ### Font
const double fontH2 = 32;
const double fontH3 = 24;
const double fontH4 = 20;
const double fontRegular = 16;

// ### Radius
BorderRadius radiusButton = BorderRadius.circular(50);

// ### Language
const List<Locale> supportedLocales = [
  Locale('zh', 'TW'),
  Locale('en', 'US'),
];

// ### Page route
Map<String, Widget> mainPages = {
  'tab_search': const PageSearchClass(),
  'tab_rule': const PagePrerequisite(),
  'tab_credit': const PageCreditProgram(),
  'tab_interdisciplinary': const PageInterdisciplinary(),
  'tab_map': const PageMap(),
};
