import '../object.dart';
import 'package:flutter/material.dart';

class PageInterdisciplinary extends StatefulWidget {
  const PageInterdisciplinary({super.key, required this.ctl});

  final SystemController ctl;

  @override
  State<PageInterdisciplinary> createState() => _PageInterdisciplinaryState();
}

class _PageInterdisciplinaryState extends State<PageInterdisciplinary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageInterdisciplinary'),
      ),
      body: const Center(
        child: Text('PageInterdisciplinary Page'),
      ),
    );
  }
}
