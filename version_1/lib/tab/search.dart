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
  bool showFilters = true;
  String searchText = "";
  TextEditingController filterInstituteSearchBar = TextEditingController(text: "");
  List<String> searchHistory = ["123", "456", "789", "123"];
  List<FilterController> ctlDepartments = [];
  List<FilterController> ctlGrades = [];
  List<FilterController> ctlClasses = [];
  List<FilterController> ctlGroups = [];
  List<FilterController> ctlLanguages = [];
  List<FilterController> ctlInstitutes = [];
  List<List<bool>> selectedTimes = List.generate(6, (index) => List.generate(12, (index) => false));
  List<List<bool>> selectedTimesHovered = List.generate(6, (index) => List.generate(12, (index) => false));

  @override
  void initState() {
    ctlDepartments = departments.map((e) {
      return FilterController(onSelected: false, name: e);
    }).toList();
    ctlGrades = grades.map((e) {
      return FilterController(onSelected: false, name: e);
    }).toList();
    ctlClasses = classes.map((e) {
      return FilterController(onSelected: false, name: e);
    }).toList();
    ctlGroups = groups.map((e) {
      return FilterController(onSelected: false, name: e);
    }).toList();
    ctlLanguages = languages.map((e) {
      return FilterController(onSelected: false, name: e);
    }).toList();
    ctlInstitutes = institutes.map((e) {
      return FilterController(onSelected: false, name: e);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
      bottomSheet: showFilters && widget.ctl.isMobile
          ? Container(
              height: 120,
              color: widget.ctl.isDarkMode ? darkBackground : lightBackground,
              alignment: Alignment.center,
              child: doneButton(),
            )
          : null,
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
    return LayoutBuilder(builder: (context, constraints) {
      double maxNameWidth = widget.ctl.isMobile ? 30 : 35.2 * widget.ctl.widthFactor;
      double eachColumnWidth = widget.ctl.isMobile ? (constraints.maxWidth - 30) / dayCodes.length : 63 * widget.ctl.widthFactor;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "search_filter_time_query".tr(),
                style: TextStyle(
                  fontSize: fontH3,
                  color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
                ),
              ),
              Text(
                "search_filter_time_query_hint".tr(),
                style: const TextStyle(
                  fontSize: fontP,
                  color: colorComponent3,
                ),
              ),
              SizedBox(height: widget.ctl.isMobile ? 10 : 30),
              Container(
                height: 55,
                width: widget.ctl.isMobile ? constraints.maxWidth : 415 * widget.ctl.widthFactor,
                padding: EdgeInsets.only(left: maxNameWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: dayCodes.asMap().entries.map((e) {
                    return InkWell(
                      onTap: () {
                        for (var i = 0; i < selectedTimes[e.key].length; i++) {
                          selectedTimes[e.key][i] = !selectedTimes[e.key][i];
                        }
                        setState(() {});
                      },
                      child: SizedBox(
                        width: eachColumnWidth,
                        child: Text(
                          e.value,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: fontP),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: maxNameWidth,
                    child: Column(
                      children: courseCodes
                          .asMap()
                          .entries
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                for (var i = 0; i < selectedTimes.length; i++) {
                                  selectedTimes[i][e.key] = !selectedTimes[i][e.key];
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 38,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e.value,
                                  style: const TextStyle(fontSize: fontP),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Row(
                    children: selectedTimes.asMap().entries.map((e) {
                      return Column(
                        children: e.value.asMap().entries.map((f) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedTimes[e.key][f.key] = !selectedTimes[e.key][f.key];
                              });
                            },
                            onHover: (value) {
                              setState(() {
                                selectedTimesHovered[e.key][f.key] = value;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedTimes[e.key][f.key]
                                    ? colorPrimary2
                                    : selectedTimesHovered[e.key][f.key]
                                        ? colorComponent4
                                        : widget.ctl.isDarkMode
                                            ? darkBackground
                                            : lightBackground,
                                border: Border.all(color: colorPrimary1, width: 1),
                              ),
                              width: eachColumnWidth,
                              height: 38,
                            ),
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              if (widget.ctl.isMobile) SizedBox(width: constraints.maxWidth, child: filterButtons()),
              if (widget.ctl.isMobile) const SizedBox(height: 120),
              if (!widget.ctl.isMobile)
                Container(
                  width: 415 * widget.ctl.widthFactor,
                  alignment: Alignment.center,
                  child: doneButton(),
                ),
            ],
          ),
          if (!widget.ctl.isMobile) SizedBox(width: 60 * widget.ctl.widthFactor),
          if (!widget.ctl.isMobile) Expanded(child: filterButtons())
        ],
      );
    });
  }

  Widget filterDepartment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("search_filter_department".tr(), style: const TextStyle(fontSize: fontH4)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ctlDepartments.map((e) {
            return TextButton(
              onPressed: () {
                setState(() {
                  e.onSelected = !e.onSelected;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                overlayColor: MaterialStateProperty.all(colorComponent2),
                backgroundColor: MaterialStateProperty.all(
                  e.onSelected
                      ? colorSecondary
                      : widget.ctl.isDarkMode
                          ? darkBackground
                          : lightBackground,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: radiusFilter,
                    side: const BorderSide(color: colorSecondary),
                  ),
                ),
              ),
              child: Text(
                e.name,
                style: const TextStyle(fontSize: fontP, color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget filterGrade() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("search_filter_grade".tr(), style: const TextStyle(fontSize: fontH4)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ctlGrades.map((e) {
            return TextButton(
              onPressed: () {
                setState(() {
                  e.onSelected = !e.onSelected;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                overlayColor: MaterialStateProperty.all(colorComponent2),
                backgroundColor: MaterialStateProperty.all(
                  e.onSelected
                      ? colorSecondary
                      : widget.ctl.isDarkMode
                          ? darkBackground
                          : lightBackground,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: radiusFilter,
                    side: const BorderSide(color: colorSecondary),
                  ),
                ),
              ),
              child: Text(
                e.name,
                style: const TextStyle(fontSize: fontP, color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget filterClass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("search_filter_class".tr(), style: const TextStyle(fontSize: fontH4)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ctlClasses.map((e) {
            return TextButton(
              onPressed: () {
                setState(() {
                  e.onSelected = !e.onSelected;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                overlayColor: MaterialStateProperty.all(colorComponent2),
                backgroundColor: MaterialStateProperty.all(
                  e.onSelected
                      ? colorSecondary
                      : widget.ctl.isDarkMode
                          ? darkBackground
                          : lightBackground,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: radiusFilter,
                    side: const BorderSide(color: colorSecondary),
                  ),
                ),
              ),
              child: Text(
                e.name,
                style: const TextStyle(fontSize: fontP, color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget filterGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("search_filter_group".tr(), style: const TextStyle(fontSize: fontH4)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ctlGroups.map((e) {
            return TextButton(
              onPressed: () {
                setState(() {
                  e.onSelected = !e.onSelected;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                overlayColor: MaterialStateProperty.all(colorComponent2),
                backgroundColor: MaterialStateProperty.all(
                  e.onSelected
                      ? colorSecondary
                      : widget.ctl.isDarkMode
                          ? darkBackground
                          : lightBackground,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: radiusFilter,
                    side: const BorderSide(color: colorSecondary),
                  ),
                ),
              ),
              child: Text(
                e.name,
                style: const TextStyle(fontSize: fontP, color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget filterInstitute() {
    return TextField(
      controller: filterInstituteSearchBar,
      style: const TextStyle(fontSize: fontP),
      onChanged: (value) {
        ctlInstitutes = [];
        for (var e in institutes) {
          if (e.toLowerCase().contains(value.toLowerCase())) {
            ctlInstitutes.add(FilterController(onSelected: false, name: e));
          }
        }
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: "search_filter_institute_hint".tr(),
        hintStyle: const TextStyle(fontSize: fontP),
        prefixIcon: const Image(image: AssetImage('assets/images/search/search.png'), width: 36, height: 36),
        suffixIcon: InkWell(
          onTap: () {},
          child: const Image(image: AssetImage('assets/images/search/mic.png'), width: 30, height: 30),
        ),
        suffixIconConstraints: const BoxConstraints.tightFor(width: 30, height: 30),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        border: OutlineInputBorder(
          borderRadius: radiusFilter,
          borderSide: const BorderSide(color: colorSecondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusFilter,
          borderSide: const BorderSide(color: colorSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusFilter,
          borderSide: const BorderSide(color: colorSecondary),
        ),
      ),
    );
  }

  Widget filterButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.ctl.isMobile) filterDepartment(),
        if (widget.ctl.isMobile) const SizedBox(height: 20),
        if (widget.ctl.isMobile) filterGrade(),
        if (!widget.ctl.isMobile)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: filterDepartment()),
              SizedBox(width: 30 * widget.ctl.widthFactor),
              Expanded(flex: 1, child: filterGrade()),
            ],
          ),
        const SizedBox(height: 20),
        if (widget.ctl.isMobile) filterClass(),
        if (widget.ctl.isMobile) const SizedBox(height: 20),
        if (widget.ctl.isMobile) filterGroup(),
        if (!widget.ctl.isMobile)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: filterClass()),
              SizedBox(width: 50 * widget.ctl.widthFactor),
              Expanded(flex: 1, child: filterGroup()),
            ],
          ),
        const SizedBox(height: 20),
        Text("search_filter_language".tr(), style: const TextStyle(fontSize: fontH4)),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ctlLanguages.map((e) {
            return TextButton(
              onPressed: () {
                setState(() {
                  e.onSelected = !e.onSelected;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                overlayColor: MaterialStateProperty.all(colorComponent2),
                backgroundColor: MaterialStateProperty.all(
                  e.onSelected
                      ? colorSecondary
                      : widget.ctl.isDarkMode
                          ? darkBackground
                          : lightBackground,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: radiusFilter,
                    side: const BorderSide(color: colorSecondary),
                  ),
                ),
              ),
              child: Text(
                e.name,
                style: const TextStyle(fontSize: fontP, color: Colors.black),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text("search_filter_institute".tr(), style: const TextStyle(fontSize: fontH4)),
            const SizedBox(width: 20),
            widget.ctl.isMobile
                ? Expanded(
                    child: filterInstitute(),
                  )
                : SizedBox(
                    width: 457 * widget.ctl.widthFactor,
                    child: filterInstitute(),
                  )
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ctlInstitutes.map((e) {
            return TextButton(
              onPressed: () {
                setState(() {
                  e.onSelected = !e.onSelected;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                overlayColor: MaterialStateProperty.all(colorComponent2),
                backgroundColor: MaterialStateProperty.all(
                  e.onSelected
                      ? colorSecondary
                      : widget.ctl.isDarkMode
                          ? darkBackground
                          : lightBackground,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: radiusFilter,
                    side: const BorderSide(color: colorSecondary),
                  ),
                ),
              ),
              child: Text(
                e.name,
                style: const TextStyle(fontSize: fontP, color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget doneButton() {
    return InkWell(
      onTap: () {
        setState(() {
          showFilters = !showFilters;
        });
      },
      child: Container(
        width: widget.ctl.isMobile ? 96 : 136,
        height: 66,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: colorPrimary2, borderRadius: radiusButton),
        child: Text(
          "search_filter_done",
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.ctl.isMobile ? fontMobileRegular : fontH4,
          ),
        ).tr(),
      ),
    );
  }
}
