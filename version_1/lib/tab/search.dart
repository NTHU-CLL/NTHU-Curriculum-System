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
  String searchText = "";
  List<String> searchHistory = ["123", "456", "789", "123"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: widget.ctl.isMobile ? 16 : 50,
            horizontal: widget.ctl.isMobile ? 50 : 100,
          ),
          child: showFilters ? searchFilter() : searchBar(),
        ),
      ),
    );
  }

  Widget searchBar() {
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
                color: colorPrimary2,
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
        SizedBox(height: widget.ctl.isMobile ? 166 : 189),
        Container(
          width: widget.ctl.isMobile ? double.infinity : 646 * widget.ctl.widthFactor,
          height: 74,
          decoration: BoxDecoration(
            color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
            borderRadius: radiusButton,
            border: Border.all(color: colorSecondary, width: 2),
          ),
          child: SearchAnchor(
            isFullScreen: false,
            viewShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
            viewBackgroundColor: widget.ctl.isDarkMode ? darkBackground : lightBackground,
            viewSurfaceTintColor: widget.ctl.isDarkMode ? darkBackground : lightBackground,
            viewConstraints: const BoxConstraints(minHeight: kToolbarHeight, maxHeight: kToolbarHeight * 6),
            headerTextStyle: TextStyle(
              fontSize: fontH3,
              color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
            ),
            viewOnChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    controller.openView();
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    searchText = value;
                    searchHistory.add(value);
                  });
                },
                onTap: () {
                  controller.openView();
                },
                hintText: 'search_input_hint'.tr(),
                hintStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: colorComponent3,
                    fontSize: widget.ctl.isMobile ? fontMobileRegular : fontH3,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: widget.ctl.isMobile ? fontMobileRegular : fontH3,
                    color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(widget.ctl.isDarkMode ? darkBackground : lightBackground),
                shadowColor: MaterialStateProperty.all(widget.ctl.isDarkMode ? darkBackground : lightBackground),
                surfaceTintColor: MaterialStateProperty.all(widget.ctl.isDarkMode ? darkBackground : lightBackground),
                overlayColor: MaterialStateProperty.all(widget.ctl.isDarkMode ? darkBackground : lightBackground),
                leading: const Image(image: AssetImage('assets/images/search/search.png'), width: 36, height: 36),
                trailing: [
                  InkWell(
                    onTap: () {},
                    child: const Image(image: AssetImage('assets/images/search/mic.png'), width: 36, height: 36),
                  ),
                ],
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return searchHistory.map((e) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      searchText = e;
                      controller.closeView(e);
                    });
                  },
                  child: Container(
                    height: 68,
                    color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
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
                            e,
                            style: TextStyle(
                              fontSize: widget.ctl.isMobile ? fontMobileRegular : fontH3,
                              color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            searchHistory.remove(e);
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
              }).toList();
            },
          ),
        ),
        SizedBox(height: widget.ctl.isMobile ? 50 : 90),
        searchText.isEmpty
            ? Container(
                width: widget.ctl.isMobile ? 96 : 136,
                height: 66,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: colorComponent4, borderRadius: radiusButton),
                child: const Text(
                  "search_start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontH4,
                  ),
                ).tr(),
              )
            : InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  width: widget.ctl.isMobile ? 96 : 136,
                  height: 66,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: colorPrimary2, borderRadius: radiusButton),
                  child: Text(
                    "search_start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.ctl.isMobile ? fontMobileRegular : fontH4,
                    ),
                  ).tr(),
                ),
              )
      ],
    );
  }

  Widget searchFilter() {
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
            color: colorPrimary2,
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
