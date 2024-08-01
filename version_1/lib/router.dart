import 'config.dart';
import 'object.dart';
import 'tab/map.dart';
import 'tab/search.dart';
import 'tab/prerequisite.dart';
import 'tab/credit.dart';
import 'tab/interdisciplinary.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.initialTab});

  final String initialTab;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  SystemController ctl = SystemController(
    isMobile: false,
    isChinese: true,
    isDarkMode: false,
    widthFactor: 1,
  );
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: tabNames.length,
      initialIndex: tabNames.indexWhere((element) => element == widget.initialTab),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    ctl.isMobile = currentWidth < mobileThreshold;
    ctl.widthFactor = ctl.isMobile ? currentWidth / designWidthMobile : currentWidth / designWidthDesktop;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 150,
        backgroundColor: ctl.isDarkMode ? darkBackground : lightBackground,
        shape: const Border(bottom: BorderSide(color: lightPrimary1, width: 1)),
        leadingWidth: 235,
        leading: Container(
          width: 235,
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Image.asset('assets/images/navbar/logo.png', width: 125, height: 120),
            onPressed: () {},
          ),
        ),
        titleSpacing: -35,
        title: ctl.isMobile
            ? null
            : TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorWeight: 1,
                indicatorColor: lightPrimary1,
                labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                dividerColor: Colors.transparent,
                tabs: tabNames.asMap().entries.map((e) {
                  return Tab(
                    child: Text(
                      e.value.tr(),
                      style: TextStyle(
                        color: e.key == _tabController.index
                            ? lightComponent6
                            : ctl.isDarkMode
                                ? lightPrimary1
                                : darkPrimary1,
                        fontSize: fontH2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: Image.asset('assets/images/navbar/light_dark.png', width: 50, height: 50),
            onPressed: () {
              setState(() {
                ctl.isDarkMode = !ctl.isDarkMode;
              });
            },
          ),
          const SizedBox(width: 12),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: Image.asset('assets/images/navbar/language.png', width: 50, height: 50),
            onPressed: () {
              setState(() {
                ctl.isChinese = !ctl.isChinese;
                context.setLocale(ctl.isChinese ? supportedLocales.first : supportedLocales.last);
              });
            },
          ),
          const SizedBox(width: 12),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: Image.asset('assets/images/navbar/schedule.png', width: 50, height: 50),
            onPressed: () {},
          ),
          const SizedBox(width: 100),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PageSearchClass(ctl: ctl),
          const PagePrerequisite(),
          const PageCreditProgram(),
          const PageInterdisciplinary(),
          const PageMap(),
        ],
      ),
    );
  }
}
