import '../config.dart';
import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: colorPrimary2,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: radiusButton),
                ),
                icon: Image.asset(
                  'assets/images/search/filter.png',
                  color: Colors.white,
                  width: 30,
                ),
                label: const Text(
                  "search_filter",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ).tr(),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: 646,
              height: 70,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: radiusButton,
                border: Border.all(color: colorSecondary, width: 2),
              ),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/search/search.png'),
                    width: 36,
                    height: 36,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchText,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: 'search_input_hint'.tr(),
                        hintStyle: const TextStyle(color: colorComponent3),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage('assets/images/search/mic.png'),
                      width: 36,
                      height: 36,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                  color: colorPrimary2,
                  borderRadius: radiusButton,
                ),
                child: const Text(
                  "search_start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ).tr(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
