import '../config.dart';
import '../provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class PageSearchClass extends StatefulWidget {
  const PageSearchClass({super.key});

  @override
  State<PageSearchClass> createState() => _PageSearchClassState();
}

class _PageSearchClassState extends State<PageSearchClass> {
  bool showFilters = false;
  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchText = TextEditingController(text: "");
  List<String> searchHistory = ["123", "456", "789", "123"];

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    searchText.dispose();
    searchFocusNode.removeListener(_onFocusChange);
    searchFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (searchFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SettingsProvider settings, child) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            color: settings.darkMode ? darkBackground : lightBackground,
            child: showFilters ? searchFilter(context, settings) : searchBar(context, settings),
          ),
        );
      },
    );
  }

  Widget searchBar(BuildContext context, SettingsProvider settings) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              setState(() {
                showFilters = !showFilters;
              });
            },
            child: Container(
              width: 164,
              height: 46,
              decoration: BoxDecoration(
                color: lightPrimary2,
                borderRadius: radiusButton,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('assets/images/search/filter.png'), width: 30, height: 30),
                  const SizedBox(width: 6),
                  const Text(
                    "search_filter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontRegular,
                    ),
                  ).tr(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 189),
        Stack(
          children: [
            if (searchFocusNode.hasFocus)
              Container(
                width: 646 * settings.widthFactor,
                height: 363,
                padding: const EdgeInsets.only(top: 85),
                decoration: BoxDecoration(
                  borderRadius: radiusButton,
                  border: Border.all(color: lightSecondary, width: 2),
                ),
                child: ListView.builder(
                  itemCount: searchHistory.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        searchText.text = searchHistory[index];
                        searchFocusNode.unfocus();
                        setState(() {});
                      },
                      child: Container(
                        height: 68,
                        padding: EdgeInsets.symmetric(horizontal: 16 * settings.widthFactor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage('assets/images/search/history.png'),
                              width: 42 * settings.widthFactor,
                              height: 42,
                            ),
                            Expanded(
                              child: Text(
                                searchHistory[index],
                                style: TextStyle(
                                  fontSize: fontH3,
                                  color: settings.darkMode ? lightBackground : darkBackground,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                searchHistory.removeAt(index);
                                setState(() {});
                              },
                              child: Image(
                                image: const AssetImage('assets/images/search/remove.png'),
                                width: 42 * settings.widthFactor,
                                height: 42,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            Container(
              width: 646 * settings.widthFactor,
              height: 74,
              decoration: BoxDecoration(
                color: settings.darkMode ? darkBackground : lightBackground,
                borderRadius: radiusButton,
                border: Border.all(color: lightSecondary, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/images/search/search.png'),
                    width: 35 * settings.widthFactor,
                    height: 35,
                  ),
                  SizedBox(
                    width: 560 * settings.widthFactor,
                    child: TextField(
                      focusNode: searchFocusNode,
                      controller: searchText,
                      style: TextStyle(
                        fontSize: fontH3,
                        color: settings.darkMode ? lightBackground : darkBackground,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        border: InputBorder.none,
                        hintText: 'search_input_hint'.tr(),
                        hintStyle: const TextStyle(color: lightComponent3, fontSize: fontH3),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image(
                      image: const AssetImage('assets/images/search/mic.png'),
                      width: 30 * settings.widthFactor,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 90),
        InkWell(
          onTap: () {
            searchText.text = "";
            searchFocusNode.unfocus();
            setState(() {});
          },
          child: Container(
            width: 136,
            height: 66,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: lightPrimary2, borderRadius: radiusButton),
            child: const Text(
              "search_start",
              style: TextStyle(
                color: Colors.white,
                fontSize: fontH4,
              ),
            ).tr(),
          ),
        )
      ],
    );
  }

  Widget searchFilter(BuildContext context, SettingsProvider settings) {
    return Container(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          setState(() {
            showFilters = !showFilters;
          });
        },
        child: Container(
          width: 164 * settings.widthFactor,
          height: 46,
          decoration: BoxDecoration(
            color: lightPrimary2,
            borderRadius: radiusButton,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/search/filter.png'),
                width: 30 * settings.widthFactor,
                height: 30,
              ),
              SizedBox(width: 6 * settings.widthFactor),
              const Text(
                "search_filter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontRegular,
                ),
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
