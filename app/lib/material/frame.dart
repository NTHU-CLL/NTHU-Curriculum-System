import '../style.dart';
import '../object.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


Widget dropDownButton(bool isLight, Icon icon, List<ButtonItem> texts) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2(
      customButton: Container(padding: const EdgeInsets.all(10), child: icon),
      items: texts.map((ButtonItem item) {
        return DropdownMenuItem(
          value: item.name,
          onTap: item.onPressed,
          child: Center(
            child: Text(
              item.name,
              style: topButtonStyle(isLight),
            ),
          )
        );
      }).toList(),
      onChanged: (String? value) {},
      dropdownStyleData: DropdownStyleData(
        width: 100,
        offset: Offset(-1.2.w, -0.5.h),
        decoration: BoxDecoration(
          color: isLight ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isLight ? Colors.black : Colors.white),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(height: 40),
    ),
  );
}
