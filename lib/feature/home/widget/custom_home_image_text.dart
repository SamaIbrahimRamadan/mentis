import 'package:flutter/material.dart';
import 'package:mentis/core/widget/custom_list_tile.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';

class CustomHomeWidget extends StatelessWidget {
  final String text, text2, text3, image;
  final void Function() onTap;
  final double? x;
  const CustomHomeWidget(
      {super.key,
      required this.text,
      required this.text2,
      required this.text3,
      required this.image,
      required this.onTap,
      this.x});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 100, top: 20),
        width: 350,
        height: 100,
        decoration: BoxDecoration(
            color: ColorManger.gray, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: x ?? 30,
                  ),
                  Text(text3, style: Styles.title14)
                ],
              ),
            ),
            CustomTextTile(text: text2, text2: text)
          ],
        ),
      ),
    );
  }
}
