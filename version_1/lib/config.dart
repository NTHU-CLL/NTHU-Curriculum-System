import 'object.dart';
import 'tab/map.dart';
import 'tab/searchClass.dart';
import 'tab/prerequisite.dart';
import 'tab/creditProgram.dart';
import 'tab/interdisciplinary.dart';
import 'package:flutter/material.dart';

// ##### setting config
// ### Language
const List<Locale> supportedLocales = [
  Locale('zh', 'TW'),
  Locale('en', 'US'),
];

// ### Page route
List<TabPage> mainPages = [
  TabPage('search', const Icon(Icons.search), const PageSearchClass()),
  TabPage('rule', const Icon(Icons.rule), const PagePrerequisite()),
  TabPage('credit', const Icon(Icons.credit_card), const PageCreditProgram()),
  TabPage('interdisciplinary', const Icon(Icons.class_outlined), const PageInterdisciplinary()),
  TabPage('map', const Icon(Icons.map), const PageMap()),
];
