import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget compactQuery(List<Widget> items) {
  return Wrap(
    spacing: 10,
    runSpacing: 10,
    alignment: WrapAlignment.start,
    runAlignment: WrapAlignment.start,
    children: items,
  );
}

Widget titleContent(bool isLight, String title, Widget content) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
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
      SizedBox(height: 1.5.h),
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
