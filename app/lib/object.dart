import 'package:flutter/material.dart';

class ButtonItem {
  String name;
  void Function() onPressed;

  ButtonItem({required this.name, required this.onPressed});
}

class SearchQueryController {
  String? select;
  TextEditingController search;
  List<String> subjects;

  SearchQueryController({required this.select, required this.search, required this.subjects});
}

class SearchQueryMultiController {
  TextEditingController search;
  List<String> selects;
  List<String> subjects;

  SearchQueryMultiController({required this.search, required this.selects, required this.subjects});
}
