import '../object.dart';
import 'package:flutter/material.dart';

SearchQueryController basicWeek = SearchQueryController(
  select: "星期 Week",
  search: TextEditingController(),
  subjects: [
    "星期 Week",
    "星期一 Monday",
    "星期二 Tuesday",
    "星期三 Wednesday",
    "星期四 Thursday",
    "星期五 Friday",
    "星期六 Saturday",
    "星期日 Sunday",
  ],
);
