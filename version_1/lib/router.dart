import 'config.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
      initialIndex: mainPages.keys.toList().indexOf(widget.initialTab),
    );
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        shape: const Border(
          bottom: BorderSide(color: colorPrimary1, width: 1),
        ),
        title: TabBar(
          dividerColor: Colors.transparent,
          controller: _tabController,
          isScrollable: true,
          tabs: mainPages.keys.indexed
              .map(
                (e) => Tab(
                  child: Text(
                    e.$2,
                    style: TextStyle(
                      color: e.$1 == _tabController.index ? colorComponent6 : colorPrimary1,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
              )
              .toList(),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/navbar/light_dark.png',
              width: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/navbar/language.png',
              width: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/navbar/schedule.png',
              width: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: mainPages.values.toList(),
      ),
    );
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }
}
