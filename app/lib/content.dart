import 'material.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

Widget mainView(BuildContext context, bool isMobile, bool isLight) {
  return SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: isMobile ? 5.w : 20.w),
      child: Column(
        children: [
          roundBorder(
            context,
            isLight,
            [
              titleContent(
                isLight,
                tr('query_department'),
                const Text("query_department"),
              ),
              titleContent(
                isLight,
                tr('query_basic'),
                const Text("query_basic"),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
