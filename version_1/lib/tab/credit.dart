import 'package:flutter/material.dart';

class PageCreditProgram extends StatefulWidget {
  const PageCreditProgram({super.key});

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
