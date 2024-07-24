import 'tab/map.dart';
import 'tab/searchClass.dart';
import 'tab/prerequisite.dart';
import 'tab/creditProgram.dart';
import 'tab/interdisciplinary.dart';
import 'package:flutter/material.dart';

// ##### Setting config
// ### Color
const Color errorColor = Color.fromRGBO(243, 13, 13, 1);
const Color primaryColor1 = Color.fromRGBO(181, 42, 203, 1);
const Color primaryColor2 = Color.fromRGBO(60, 195, 38, 1);
const Color secondaryColor = Color.fromRGBO(231, 153, 193, 1);
const Color componentColor1 = Color.fromRGBO(83, 210, 39, 1);
const Color componentColor2 = Color.fromRGBO(250, 137, 195, 1);
const Color componentColor3 = Color.fromRGBO(180, 180, 180, 1);
const Color componentColor4 = Color.fromRGBO(218, 218, 218, 1);
const Color componentColor5 = Color.fromRGBO(71, 192, 29, 1);
const Color componentColor6 = Color.fromRGBO(138, 19, 143, 1);
const Color componentColor7 = Color.fromRGBO(233, 85, 161, 1);

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
