import 'package:flutter/material.dart';

Widget rwd(bool isMobile, double maxSize, Widget mainContent, Widget searchFunction) {
  return isMobile
      ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            mainContent,
            const SizedBox(height: 10),
            Container(alignment: Alignment.centerRight, child: searchFunction),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: maxSize, child: mainContent),
            Container(alignment: Alignment.centerRight, child: searchFunction),
          ],
        );
}
