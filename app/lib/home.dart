import 'color.dart';
import 'object.dart';
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
  ThemeMode mainThemeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    bool isLight = mainThemeMode != ThemeMode.dark;
    bool isMobile = Device.screenType == ScreenType.mobile;
    return MaterialApp(
      title: "NTHU Curriculum 課程系統",
      theme: getTheme(true),
      darkTheme: getTheme(false),
      themeMode: mainThemeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .appBarTheme
              .backgroundColor,
          title: const Text('title').tr(),
          actions: [
            IconButton(
              icon: Icon(isLight ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  mainThemeMode = isLight ? ThemeMode.dark : ThemeMode.light;
                });
              },
            ),
            SizedBox(width: 0.5.w),
            dropDownButton(
              Icon(Icons.language, size: 14.sp),
              [
                ButtonItem(
                  name: tr('lang_en'),
                  onPressed: () {
                    context.setLocale(const Locale('en', 'US'));
                  },
                ),
                ButtonItem(
                  name: tr('lang_zh'),
                  onPressed: () {
                    context.setLocale(const Locale('zh', 'TW'));
                  },
                ),
              ],
            ),
            SizedBox(width: 2.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: isMobile ? 5.w : 20.w),
            child: Column(
              children: [
                roundBorder(
                  [
                    titleContent(
                      tr('department_query'),
                      const Text("department_query"),
                    ),
                    titleContent(
                      tr('basic_query'),
                      const Text("basic_query"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
