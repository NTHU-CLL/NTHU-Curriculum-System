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
  bool openDrawer = false;
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
      initialIndex: 1,
      //initialIndex: tabNames.indexWhere((element) => element == widget.initialTab),
    );
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
        shape: Border(
          bottom: BorderSide(
            width: 1,
            color: ctl.isMobile ? Colors.transparent : colorPrimary1,
          ),
        ),
        leadingWidth: ctl.isMobile ? 185 : 235,
        leading: Container(
          width: ctl.isMobile ? 185 : 235,
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
                indicatorColor: colorPrimary1,
                labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                dividerColor: Colors.transparent,
                tabs: tabNames.asMap().entries.map((e) {
                  return Tab(
                    child: Text(
                      e.value.tr(),
                      style: TextStyle(
                        color: e.key == _tabController.index ? colorComponent6 : colorPrimary1,
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
            icon: Image.asset('assets/images/navbar/light_dark.png', width: 48, height: 48),
            onPressed: () {
              setState(() {
                ctl.isDarkMode = !ctl.isDarkMode;
              });
            },
          ),
          const SizedBox(width: 12),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: Image.asset('assets/images/navbar/language.png', width: 48, height: 48),
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
            icon: Image.asset('assets/images/navbar/schedule.png', width: 48, height: 48),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
          if (ctl.isMobile)
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.menu, size: 48, color: colorPrimary1),
              onPressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          height: 272,
                          margin: const EdgeInsets.only(right: 50),
                          decoration: BoxDecoration(
                            color: ctl.isDarkMode ? darkBackground : lightBackground,
                            border: Border.all(color: colorPrimary1, width: 1),
                            borderRadius: radiusMenu,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: Image.asset('assets/images/search/remove.png', width: 50, height: 50),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: tabNames.asMap().entries.map((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      _tabController.animateTo(e.key);
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 15),
                                      child: Text(
                                        e.value.tr(),
                                        style: TextStyle(
                                          fontSize: fontMobileLarge,
                                          decoration: TextDecoration.none,
                                          color: e.key == _tabController.index ? colorComponent6 : colorPrimary1,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          SizedBox(width: ctl.isMobile ? 50 : 100),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PageSearchClass(ctl: ctl),
          PagePrerequisite(ctl: ctl),
          PageCreditProgram(ctl: ctl),
          PageInterdisciplinary(ctl: ctl),
          PageMap(ctl: ctl),
        ],
      ),
    );
  }
}
