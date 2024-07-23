import 'package:flutter/material.dart';

class PagePrerequisite extends StatefulWidget {
  const PagePrerequisite({super.key});

  @override
  State<PagePrerequisite> createState() => _PagePrerequisiteState();
}

class _PagePrerequisiteState extends State<PagePrerequisite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PagePrerequisite'),
      ),
      body: const Center(
        child: Text('PagePrerequisite Page'),
      ),
    );
  }
}
