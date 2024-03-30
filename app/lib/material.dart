import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget titleContent(String title, Widget content) {
  return Column(
    children: [
      Row(children: [Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold))]),
      content,
    ],
  );
}
