import '../../style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget searchButton(bool isLight, Function() onPressed) {
  return TextButton.icon(
    onPressed: onPressed,
    icon: Icon(
      Icons.search,
      size: 20,
      color: isLight ? Colors.white : Colors.black,
    ),
    label: Text(
      'search_hint'.tr(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isLight ? Colors.white : Colors.black,
      ),
    ),
    style: TextButton.styleFrom(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.topRight,
      backgroundColor: isLight ? Colors.black : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );
}
