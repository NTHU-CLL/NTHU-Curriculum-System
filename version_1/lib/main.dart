import 'config.dart';
import 'router.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setPathUrlStrategy();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/translations',
      startLocale: supportedLocales.first,
      child: const CurriculumSystem(),
    ),
  );
}

class CurriculumSystem extends StatelessWidget {
  const CurriculumSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NTHU Curriculum',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final Uri uri = Uri.parse(settings.name ?? '/');
        final List<String> pathSegments = uri.pathSegments;
        final String tabName = pathSegments.isEmpty ? mainPages.first.name : pathSegments.first;

        if (mainPages.any((tab) => tab.name == tabName)) {
          return MaterialPageRoute(
            builder: (context) => MainPage(initialTab: tabName),
          );
        }

        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('404 - Page not found'),
            ),
          ),
        );
      },
    );
  }
}
