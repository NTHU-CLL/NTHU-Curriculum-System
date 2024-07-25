import 'tab/map.dart';
import 'tab/search.dart';
import 'tab/prerequisite.dart';
import 'tab/credit.dart';
import 'tab/interdisciplinary.dart';
import 'package:flutter/material.dart';

// ##### Setting config
// ### Color
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
