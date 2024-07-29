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
  TextEditingController searchText = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SettingsProvider settings, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          color: settings.darkMode ? darkBackground : lightBackground,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {},
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
                          const Image(
                            image: AssetImage('assets/images/search/filter.png'),
                            width: 30,
                            height: 30,
                          ),
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
                Container(
                  width: 646,
                  height: 74,
                  decoration: BoxDecoration(
                    borderRadius: radiusButton,
                    border: Border.all(color: lightSecondary, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/search/search.png'),
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        width: 560,
                        child: TextField(
                          controller: searchText,
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
                        child: const Image(
                          image: AssetImage('assets/images/search/mic.png'),
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 90),
                InkWell(
                  onTap: () {},
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
            ),
          ),
        );
      },
    );
  }
}
