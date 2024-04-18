import '../../style.dart';
import 'package:flutter/material.dart';

Widget hashTag(bool isLight, bool isOn, String tagText, Function() onPressed) {
  return InkWell(
    onTap: onPressed,
    child: IntrinsicWidth(
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isLight
              ? isOn
                  ? Colors.black
                  : Colors.white
              : isOn
                  ? Colors.white
                  : Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isLight
                ? isOn
                    ? Colors.white
                    : Colors.black
                : isOn
                    ? Colors.black
                    : Colors.white,
            width: 1,
          ),
        ),
        child: Text(
          "#$tagText",
          style: bodyContentStyle(isLight).copyWith(
            color: isOn
                ? isLight
                    ? Colors.white
                    : Colors.black
                : isLight
                    ? Colors.black
                    : Colors.white,
          ),
        ),
      ),
    ),
  );
}
