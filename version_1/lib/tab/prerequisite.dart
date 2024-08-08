import '../config.dart';
import '../object.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PagePrerequisite extends StatefulWidget {
  const PagePrerequisite({super.key, required this.ctl});

  final SystemController ctl;

  @override
  State<PagePrerequisite> createState() => _PagePrerequisiteState();
}

class _PagePrerequisiteState extends State<PagePrerequisite> {
  bool openSelect = false;
  bool anySelected = false;
  TextEditingController searchBarText = TextEditingController();
  List<FilterController> ctlBachelors = [];
  List<FilterController> ctlColleges = [];
  List<FilterController> ctlInstitutes = [];
  List<FilterController> ctlOthers = [];

  @override
  void initState() {
    for (String department in departmentBachelors) {
      ctlBachelors.add(FilterController(onSelected: false, name: department));
    }
    for (String department in departmentColleges) {
      ctlColleges.add(FilterController(onSelected: false, name: department));
    }
    for (String department in departmentInstitutes) {
      ctlInstitutes.add(FilterController(onSelected: false, name: department));
    }
    for (String department in departmentOthers) {
      ctlOthers.add(FilterController(onSelected: false, name: department));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.ctl.isDarkMode ? darkBackground : lightBackground,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: widget.ctl.isMobile ? 50 : 245 * widget.ctl.widthFactor),
          child: widget.ctl.isMobile ? viewMobile() : viewDesktop(),
        ),
      ),
    );
  }

  bool checkSelected() {
    for (FilterController e in ctlBachelors) {
      if (e.onSelected) {
        return true;
      }
    }

    for (FilterController e in ctlColleges) {
      if (e.onSelected) {
        return true;
      }
    }

    for (FilterController e in ctlInstitutes) {
      if (e.onSelected) {
        return true;
      }
    }

    for (FilterController e in ctlOthers) {
      if (e.onSelected) {
        return true;
      }
    }

    return false;
  }

  Widget searchFilter() {
    return TextField(
      controller: searchBarText,
      style: TextStyle(fontSize: fontP, color: widget.ctl.isDarkMode ? lightBackground : darkBackground),
      onChanged: (value) {
        ctlBachelors = [];
        for (var e in departmentBachelors) {
          if (e.toLowerCase().contains(value.toLowerCase())) {
            ctlBachelors.add(FilterController(onSelected: false, name: e));
          }
        }
        ctlColleges = [];
        for (var e in departmentColleges) {
          if (e.toLowerCase().contains(value.toLowerCase())) {
            ctlColleges.add(FilterController(onSelected: false, name: e));
          }
        }
        ctlInstitutes = [];
        for (var e in institutes) {
          if (e.toLowerCase().contains(value.toLowerCase())) {
            ctlInstitutes.add(FilterController(onSelected: false, name: e));
          }
        }
        ctlOthers = [];
        for (var e in departmentOthers) {
          if (e.toLowerCase().contains(value.toLowerCase())) {
            ctlOthers.add(FilterController(onSelected: false, name: e));
          }
        }
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: "rule_select_department_hint".tr(),
        hintStyle: TextStyle(fontSize: fontP, color: widget.ctl.isDarkMode ? lightBackground : darkBackground),
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

  Widget viewDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: openSelect ? 100 : 250),
            Stack(
              children: [
                if (openSelect)
                  Container(
                    width: 1160 * widget.ctl.widthFactor,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(borderRadius: radiusButton, border: Border.all(color: colorSecondary, width: 1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Center(
                          child: SizedBox(
                            width: 600 * widget.ctl.widthFactor,
                            height: 48,
                            child: searchFilter(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "rule_department",
                          style: TextStyle(
                            fontSize: fontH4,
                            color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
                          ),
                        ).tr(),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: ctlBachelors.map((e) {
                            return TextButton(
                              onPressed: () {
                                setState(() {
                                  e.onSelected = !e.onSelected;
                                  anySelected = checkSelected();
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
                                style: TextStyle(fontSize: fontP, color: widget.ctl.isDarkMode ? lightBackground : darkBackground),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "rule_bachelor",
                          style: TextStyle(
                            fontSize: fontH4,
                            color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
                          ),
                        ).tr(),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: ctlColleges.map((e) {
                            return TextButton(
                              onPressed: () {
                                setState(() {
                                  e.onSelected = !e.onSelected;
                                  anySelected = checkSelected();
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
                                style: TextStyle(fontSize: fontP, color: widget.ctl.isDarkMode ? lightBackground : darkBackground),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "rule_graduate",
                          style: TextStyle(
                            fontSize: fontH4,
                            color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
                          ),
                        ).tr(),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: ctlInstitutes.map((e) {
                            return TextButton(
                              onPressed: () {
                                setState(() {
                                  e.onSelected = !e.onSelected;
                                  anySelected = checkSelected();
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
                                style: TextStyle(fontSize: fontP, color: widget.ctl.isDarkMode ? lightBackground : darkBackground),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "rule_other",
                          style: TextStyle(
                            fontSize: fontH4,
                            color: widget.ctl.isDarkMode ? lightBackground : darkBackground,
                          ),
                        ).tr(),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: ctlOthers.map((e) {
                            return TextButton(
                              onPressed: () {
                                setState(() {
                                  e.onSelected = !e.onSelected;
                                  anySelected = checkSelected();
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
                                style: TextStyle(fontSize: fontP, color: widget.ctl.isDarkMode ? lightBackground : darkBackground),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                InkWell(
                  onTap: () {
                    setState(() {
                      openSelect = !openSelect;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 1160 * widget.ctl.widthFactor,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: colorSecondary, borderRadius: radiusButton),
                        child: Text(
                          'rule_select_department'.tr(),
                          style: const TextStyle(fontSize: fontH3, color: Colors.white),
                        ),
                      ),
                      Container(
                        width: 1160 * widget.ctl.widthFactor,
                        height: 60,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(color: Colors.transparent, borderRadius: radiusButton),
                        child: Icon(
                          openSelect ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                const SizedBox(height: 250),
                anySelected
                    ? InkWell(
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
                    : Container(
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
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget viewMobile() {
    return Column(
      children: [
        const SizedBox(height: 60),
        Container(
          height: 60,
          child: searchFilter(),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
