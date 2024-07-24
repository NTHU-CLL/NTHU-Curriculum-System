import 'tab/map.dart';
import 'tab/searchClass.dart';
import 'tab/prerequisite.dart';
import 'tab/creditProgram.dart';
import 'tab/interdisciplinary.dart';
import 'package:flutter/material.dart';

// ##### Setting config
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
