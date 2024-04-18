import '../style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget keyword(bool isLight, TextEditingController queryCtl, double width, String hintText) {
  return SizedBox(
    width: width,
    height: 45,
    child: TextField(
      controller: queryCtl,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: bodyContentStyle(isLight),
        contentPadding: const EdgeInsets.all(10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: isLight ? Colors.black : Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: isLight ? Colors.black : Colors.white,
          ),
        ),
      ),
    ),
  );
}
