import '../object.dart';
import 'package:flutter/material.dart';

class PageMap extends StatefulWidget {
  const PageMap({super.key, required this.ctl});

  final SystemController ctl;

  @override
  State<PageMap> createState() => _PageMapState();
}

class _PageMapState extends State<PageMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageMap'),
      ),
      body: const Center(
        child: Text('PageMap Page'),
      ),
    );
  }
}
