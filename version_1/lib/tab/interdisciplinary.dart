import '../config.dart';
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
