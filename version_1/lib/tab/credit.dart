import '../config.dart';
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
      body: Container(
        color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.ctl.isMobile ? 20 : 245 * widget.ctl.widthFactor,
            ),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
