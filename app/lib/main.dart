import 'object.dart';
import 'define/week.dart';
import 'define/semester.dart';
import 'define/department.dart';
import 'material/frame.dart';
import 'material/query.dart';
import 'material/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import 'style.dart';

List<Course> courses = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'TW'),
      ],
      path: 'assets/translations',
      startLocale: const Locale('zh', 'TW'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode mainThemeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NTHU Curriculum 課程系統",
      themeMode: mainThemeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: ResponsiveSizer(
        maxMobileWidth: 900,
        builder: (context, orientation, screenType) {
          bool isLight = mainThemeMode != ThemeMode.dark;
          bool isMobile = Device.screenType == ScreenType.mobile;
          return Scaffold(
            backgroundColor: isLight ? Colors.white : Colors.blueGrey[700],
            appBar: AppBar(
              backgroundColor: isLight ? Colors.cyanAccent : Colors.black,
              title: const Text('title').tr(),
              titleTextStyle: topTitleStyle(isLight),
              actions: [
                IconButton(
                  icon: Icon(
                    isLight ? Icons.dark_mode : Icons.light_mode,
                    size: topIconSize,
                    color: isLight ? Colors.black : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      mainThemeMode = isLight ? ThemeMode.dark : ThemeMode.light;
                    });
                  },
                ),
                SizedBox(width: 0.5.w),
                dropDownButton(
                  isLight,
                  Icon(
                    Icons.language,
                    size: topIconSize,
                    color: isLight ? Colors.black : Colors.white,
                  ),
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
                      context,
                      isLight,
                      [
                        titleContent(
                          isLight,
                          tr('query_basic'),
                          compactQuery([
                            dropDownButtonSearch(isLight, 200, querySemester),
                            dropDownButtonSearch(isLight, 250, queryDepartment),
                            dropDownButtonSearch(isLight, 180, queryWeek),
                          ]),
                        ),
                        SizedBox(height: 3.h),
                        titleContent(
                          isLight,
                          tr('query_mix'),
                          compactQuery([
                            dropDownButtonSearch(isLight, 200, querySemester),
                            dropDownButtonSearch(isLight, 250, queryDepartment),
                          ]),
                        ),
                        SizedBox(height: 3.h),
                        titleContent(
                          isLight,
                          tr('query_advanced'),
                          compactQuery([
                            dropDownButtonSearch(isLight, 200, querySemester),
                            dropDownButtonSearch(isLight, 250, queryDepartment),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
