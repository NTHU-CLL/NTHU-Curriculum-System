import 'package:flutter/widgets.dart';

import 'define/expertise.dart';
import 'style.dart';
import 'object.dart';
import 'define/week.dart';
import 'define/time.dart';
import 'define/class.dart';
import 'define/grade.dart';
import 'define/group.dart';
import 'define/college.dart';
import 'define/program.dart';
import 'define/semester.dart';
import 'define/department.dart';
import 'material/query.dart';
import 'material/keyword.dart';
import 'material/button/hashtag.dart';
import 'material/button/search.dart';
import 'material/dropdown/appbar.dart';
import 'material/dropdown/search.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

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
  bool showAdvance = true;
  bool advanceEnglish = false;
  bool advanceChinese = false;
  bool advanceSub1 = false;
  bool advanceSub2 = false;
  bool advanceSub3 = false;
  bool advanceSub4 = false;
  bool advanceSub5 = false;
  bool advanceSub6 = false;
  bool advanceSub7 = false;
  bool advanceSub8 = false;
  bool advanceSub9 = false;
  bool advanceSub10 = false;
  bool expertiseColumnar = false;
  bool expertiseTable = false;
  ThemeMode mainThemeMode = ThemeMode.system;
  TextEditingController basicKeyword = TextEditingController();
  TextEditingController advanceTeacher = TextEditingController();
  TextEditingController advanceCode = TextEditingController();
  TextEditingController advanceGeneral = TextEditingController();

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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double maxSize = constraints.maxWidth - 200;
                    return Column(
                      children: [
                        roundBorder(
                          context,
                          isLight,
                          [
                            titleContent(
                              isLight,
                              tr('query_basic'),
                              compactQuery([
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 170,
                                  isMobile ? constraints.maxWidth : 170,
                                  basicSemester,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 250,
                                  isMobile ? constraints.maxWidth : 250,
                                  basicDepartment,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 180,
                                  isMobile ? constraints.maxWidth : 180,
                                  basicWeek,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 200,
                                  isMobile ? constraints.maxWidth : 150,
                                  basicStartTime,
                                ),
                                keyword(isLight, basicKeyword, isMobile ? constraints.maxWidth : 200, "basic_keyword".tr()),
                              ]),
                            ),
                            SizedBox(height: 3.h),
                            titleContent(
                              isLight,
                              tr('query_mix'),
                              compactQuery([
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 170,
                                  isMobile ? constraints.maxWidth : 170,
                                  mixSemester,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 180,
                                  isMobile ? constraints.maxWidth : 180,
                                  mixCollege,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 180,
                                  isMobile ? constraints.maxWidth : 180,
                                  mixDepartment,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 150,
                                  isMobile ? constraints.maxWidth : 180,
                                  mixGrade,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 150,
                                  isMobile ? constraints.maxWidth : 180,
                                  mixClass,
                                ),
                                dropDownButtonSearch(
                                  isLight,
                                  isMobile ? constraints.maxWidth : 150,
                                  isMobile ? constraints.maxWidth : 180,
                                  mixGroup,
                                ),
                              ]),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(
                                  showAdvance ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                  size: 38,
                                  color: isLight ? Colors.grey : Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    showAdvance = !showAdvance;
                                  });
                                },
                              ),
                            ),
                            if (showAdvance)
                              titleContent(
                                isLight,
                                tr('query_advanced'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    compactQuery([
                                      keyword(isLight, advanceTeacher, isMobile ? constraints.maxWidth : 250, "advance_teacher".tr()),
                                      keyword(isLight, advanceCode, isMobile ? constraints.maxWidth : 250, "advance_code".tr()),
                                      keyword(isLight, advanceGeneral, isMobile ? constraints.maxWidth : 250, "advance_general".tr()),
                                    ]),
                                    const SizedBox(height: 15),
                                    compactQuery([
                                      hashTag(
                                        isLight,
                                        advanceEnglish,
                                        "advance_lang_en".tr(),
                                        () {
                                          setState(() {
                                            advanceEnglish = !advanceEnglish;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceChinese,
                                        "advance_lang_zh".tr(),
                                        () {
                                          setState(() {
                                            advanceChinese = !advanceChinese;
                                          });
                                        },
                                      ),
                                    ]),
                                    const SizedBox(height: 15),
                                    compactQuery([
                                      hashTag(
                                        isLight,
                                        advanceSub1,
                                        "advance_sub_1".tr(),
                                        () {
                                          setState(() {
                                            advanceSub1 = !advanceSub1;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub2,
                                        "advance_sub_2".tr(),
                                        () {
                                          setState(() {
                                            advanceSub2 = !advanceSub2;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub3,
                                        "advance_sub_3".tr(),
                                        () {
                                          setState(() {
                                            advanceSub3 = !advanceSub3;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub4,
                                        "advance_sub_4".tr(),
                                        () {
                                          setState(() {
                                            advanceSub4 = !advanceSub4;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub5,
                                        "advance_sub_5".tr(),
                                        () {
                                          setState(() {
                                            advanceSub5 = !advanceSub5;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub6,
                                        "advance_sub_6".tr(),
                                        () {
                                          setState(() {
                                            advanceSub6 = !advanceSub6;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub7,
                                        "advance_sub_7".tr(),
                                        () {
                                          setState(() {
                                            advanceSub7 = !advanceSub7;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub8,
                                        "advance_sub_8".tr(),
                                        () {
                                          setState(() {
                                            advanceSub8 = !advanceSub8;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub9,
                                        "advance_sub_9".tr(),
                                        () {
                                          setState(() {
                                            advanceSub9 = !advanceSub9;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        advanceSub10,
                                        "advance_sub_10".tr(),
                                        () {
                                          setState(() {
                                            advanceSub10 = !advanceSub10;
                                          });
                                        },
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 10),
                            Container(
                              alignment: Alignment.centerRight,
                              child: searchButton(isLight, () {}),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        roundBorder(
                          context,
                          isLight,
                          [
                            titleContent(
                              isLight,
                              tr('query_regulation'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  compactQuery([
                                    dropDownButtonSearch(
                                      isLight,
                                      isMobile ? maxSize : 250,
                                      isMobile ? constraints.maxWidth : 250,
                                      regulationDepartment,
                                    ),
                                  ]),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: searchButton(isLight, () {}),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        roundBorder(
                          context,
                          isLight,
                          [
                            titleContent(
                              isLight,
                              tr('query_program'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: maxSize,
                                    child: compactQuery([
                                      dropDownButtonSearch(
                                        isLight,
                                        isMobile ? maxSize : 170,
                                        isMobile ? constraints.maxWidth : 170,
                                        programSemester,
                                      ),
                                      dropDownButtonSearch(
                                        isLight,
                                        isMobile ? maxSize : 250,
                                        isMobile ? constraints.maxWidth : 250,
                                        creditProgram,
                                      ),
                                    ]),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: searchButton(isLight, () {}),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        roundBorder(
                          context,
                          isLight,
                          [
                            titleContent(
                              isLight,
                              tr('query_college'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: maxSize,
                                    child: compactQuery([
                                      dropDownButtonSearch(
                                        isLight,
                                        isMobile ? constraints.maxWidth : 170,
                                        isMobile ? constraints.maxWidth : 170,
                                        expertiseSemester,
                                      ),
                                      dropDownButtonSearch(
                                        isLight,
                                        isMobile ? constraints.maxWidth : 230,
                                        isMobile ? constraints.maxWidth : 230,
                                        expertise1,
                                      ),
                                      dropDownButtonSearch(
                                        isLight,
                                        isMobile ? constraints.maxWidth : 230,
                                        isMobile ? constraints.maxWidth : 230,
                                        expertise2,
                                      ),
                                      hashTag(
                                        isLight,
                                        expertiseColumnar,
                                        "college_columnar".tr(),
                                        () {
                                          setState(() {
                                            expertiseColumnar = !expertiseColumnar;
                                          });
                                        },
                                      ),
                                      hashTag(
                                        isLight,
                                        expertiseTable,
                                        "college_timetable".tr(),
                                        () {
                                          setState(() {
                                            expertiseTable = !expertiseTable;
                                          });
                                        },
                                      ),
                                    ]),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: searchButton(isLight, () {}),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
