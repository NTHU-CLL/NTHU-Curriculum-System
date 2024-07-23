import '../../style.dart';
import '../../object.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

Widget dropDownButtonSearch(bool isLight, double widthTop, double widthList, SearchQueryController queryCtl) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setSearchState) {
      return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: isLight ? Colors.black : Colors.white,
            ),
          ),
          items: queryCtl.subjects
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(item, style: bodyContentStyle(isLight)),
                ),
              )
              .toList(),
          value: queryCtl.select,
          onChanged: (value) {
            setSearchState(() {
              queryCtl.select = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: widthTop,
            height: 45,
            decoration: BoxDecoration(
              color: isLight ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isLight ? Colors.black : Colors.white),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 500,
            width: widthList,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: isLight ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isLight ? Colors.black : Colors.white),
            ),
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: queryCtl.search,
            searchInnerWidgetHeight: 40,
            searchInnerWidget: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: queryCtl.search,
                style: bodyContentStyle(isLight),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "search_hint".tr(),
                  hintStyle: bodyContentStyle(isLight),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
