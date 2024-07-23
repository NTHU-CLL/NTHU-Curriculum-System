import 'package:flutter/material.dart';

class Course {
  String courseCodeID;
  String nameChinese;
  String nameEnglish;
  int credits;
  int quota;
  int newerReserve;
  int generalTarget;
  int generalCategory;
  int language;
  String note;
  String cancel;
  String classroomTime;
  String instructor;
  String prerequisite;
  String restriction;
  String expertise;
  String creditProgram;
  String affidavit;
  String requiredElective;

  Course({
    required this.courseCodeID,
    required this.nameChinese,
    required this.nameEnglish,
    required this.credits,
    required this.quota,
    required this.newerReserve,
    required this.generalTarget,
    required this.generalCategory,
    required this.language,
    required this.note,
    required this.cancel,
    required this.classroomTime,
    required this.instructor,
    required this.prerequisite,
    required this.restriction,
    required this.expertise,
    required this.creditProgram,
    required this.affidavit,
    required this.requiredElective,
  });
}

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
