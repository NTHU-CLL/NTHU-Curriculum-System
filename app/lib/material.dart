import 'object.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget dropDownButton(Icon icon, List<ButtonItem> texts) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2(
      customButton: Container(padding: const EdgeInsets.all(10), child: icon),
      items: texts.map((ButtonItem item) {
        return DropdownMenuItem(
          value: item.name,
          onTap: item.onPressed,
          child: Text(
            item.name,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? value) {},
      dropdownStyleData: DropdownStyleData(
        width: 5.w,
        offset: Offset(-1.2.w, -0.5.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    ),
  );
}

Widget titleContent(String title, Widget content) {
  return Column(
    children: [
      Row(
        children: [
          Icon(Icons.circle, size: 10.sp),
          SizedBox(width: 1.w),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content,
    ],
  );
}

Widget roundBorder(List<Widget> content) {
  return Container(
    padding: EdgeInsets.all(4.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(width: 4),
    ),
    child: Column(children: content),
  );
}
