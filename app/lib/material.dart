import 'package:easy_localization/easy_localization.dart';

import 'object.dart';
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
          child: Text(
            item.name,
            style: TextStyle(fontSize: 11.sp, color: isLight ? Colors.black : Colors.white),
          ),
        );
      }).toList(),
      onChanged: (String? value) {},
      dropdownStyleData: DropdownStyleData(
        width: 5.w,
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

Widget dropDownButtonSearch(bool isLight, SearchQueryController queryCtl) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setSearchState) {
      return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          items: queryCtl.subjects
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: TextStyle(fontSize: 14, color: isLight ? Colors.black : Colors.white)),
                  ))
              .toList(),
          value: queryCtl.select,
          onChanged: (value) {
            setSearchState(() {
              queryCtl.select = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              color: isLight ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isLight ? Colors.black : Colors.white),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 400,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isLight ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isLight ? Colors.black : Colors.white),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(height: 40),
          dropdownSearchData: DropdownSearchData(
            searchController: queryCtl.search,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: queryCtl.search,
                style: TextStyle(fontSize: 10.sp, color: isLight ? Colors.black : Colors.white),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  hintText: "search_hint".tr(),
                  hintStyle: TextStyle(fontSize: 10.sp, color: isLight ? Colors.black : Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: isLight ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              queryCtl.search.clear();
            }
          },
        ),
      );
    },
  );
}

Widget titleContent(bool isLight, String title, Widget content) {
  return Column(
    children: [
      Row(
        children: [
          Icon(
            Icons.circle,
            size: 10.sp,
            color: isLight ? Colors.black : Colors.white,
          ),
          SizedBox(width: 1.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: isLight ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
      content,
    ],
  );
}

Widget roundBorder(BuildContext context, bool isLight, List<Widget> content) {
  return Container(
    padding: EdgeInsets.all(4.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(width: 4, color: isLight ? Colors.black : Colors.white),
    ),
    child: Column(children: content),
  );
}
