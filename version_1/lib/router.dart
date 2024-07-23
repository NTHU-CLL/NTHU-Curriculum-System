import 'config.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.initialTab});

  final String initialTab;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: mainPages.length,
      initialIndex: mainPages.indexWhere((e) => e.name == widget.initialTab),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: mainPages.map((e) => Tab(child: e.indicator)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: mainPages.map((e) => e.content).toList(),
      ),
    );
  }
}
