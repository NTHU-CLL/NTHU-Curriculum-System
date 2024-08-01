import '../config.dart';
import '../object.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PageSearchClass extends StatefulWidget {
  const PageSearchClass({super.key, required this.ctl});

  final SystemController ctl;

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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
        child: showFilters ? searchFilter(context) : searchBar(context),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
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
                width: 646 * widget.ctl.widthFactor,
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
                        padding: EdgeInsets.symmetric(horizontal: 16 * widget.ctl.widthFactor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage('assets/images/search/history.png'),
                              width: 42 * widget.ctl.widthFactor,
                              height: 42,
                            ),
                            Expanded(
                              child: Text(
                                searchHistory[index],
                                style: TextStyle(
                                  fontSize: fontH3,
                                  color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
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
                                width: 42 * widget.ctl.widthFactor,
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
              width: 646 * widget.ctl.widthFactor,
              height: 74,
              decoration: BoxDecoration(
                color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
                borderRadius: radiusButton,
                border: Border.all(color: lightSecondary, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/images/search/search.png'),
                    width: 35 * widget.ctl.widthFactor,
                    height: 35,
                  ),
                  SizedBox(
                    width: 560 * widget.ctl.widthFactor,
                    child: TextField(
                      focusNode: searchFocusNode,
                      controller: searchText,
                      style: TextStyle(
                        fontSize: fontH3,
                        color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
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
                      width: 30 * widget.ctl.widthFactor,
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

  Widget searchFilter(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          setState(() {
            showFilters = !showFilters;
          });
        },
        child: Container(
          width: 164 * widget.ctl.widthFactor,
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
                width: 30 * widget.ctl.widthFactor,
                height: 30,
              ),
              SizedBox(width: 6 * widget.ctl.widthFactor),
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
