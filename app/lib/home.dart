import 'material.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = Device.screenType == ScreenType.mobile;
    bool isEnglish = context.locale == const Locale('en', 'US');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('title').tr(),
        actions: [
          TextButton(
            onPressed: () {
              context.setLocale(isEnglish ? const Locale('zh', 'TW') : const Locale('en', 'US'));
            },
            child: Text(
              isEnglish ? tr('lang_zh') : tr('lang_en'),
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: isMobile ? 5.w : 20.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    titleContent(
                      tr('basic_query'),
                      const Text("basic_query"),
                    ),
                    titleContent(
                      tr('department_query'),
                      const Text("basic_query"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
