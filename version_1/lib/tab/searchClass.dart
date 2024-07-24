import 'package:flutter/material.dart';

class PageSearchClass extends StatefulWidget {
  const PageSearchClass({super.key});

  @override
  State<PageSearchClass> createState() => _PageSearchClassState();
}

class _PageSearchClassState extends State<PageSearchClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageSearchClass'),
      ),
      body: const Center(
        child: Text('PageSearchClass Page'),
      ),
    );
  }
}
