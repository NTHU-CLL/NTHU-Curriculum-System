import '../object.dart';
import 'package:flutter/material.dart';

class PageCreditProgram extends StatefulWidget {
  const PageCreditProgram({super.key, required this.ctl});

  final SystemController ctl;

  @override
  State<PageCreditProgram> createState() => _PageCreditProgramState();
}

class _PageCreditProgramState extends State<PageCreditProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageCreditProgram'),
      ),
      body: const Center(
        child: Text('PageCreditProgram Page'),
      ),
    );
  }
}
