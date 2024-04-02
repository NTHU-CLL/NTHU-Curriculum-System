import 'color.dart';
import 'content.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import 'material.dart';
import 'object.dart';

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
    return ResponsiveSizer(
      maxMobileWidth: 900,
      builder: (context, orientation, screenType) {
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
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              title: const Text('title').tr(),
              actions: [
                IconButton(
                  icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode),
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
            body: mainView(context, isMobile),
          ),
        );
      },
    );
  }
}
