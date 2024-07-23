import 'tab/map.dart';
import 'tab/search.dart';
import 'tab/prerequisite.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const CurriculumSystem());
}

class CurriculumSystem extends StatelessWidget {
  const CurriculumSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NTHU Curriculum',
      debugShowCheckedModeBanner: false,
      initialRoute: '/search',
      routes: {
        '/search': (context) => const PageSearch(),
        '/map': (context) => const PageMap(),
        '/prerequisite': (context) => const PagePrerequisite(),
      },
      onGenerateRoute: (settings) {
        // Handle unknown routes
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
