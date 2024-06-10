import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/styles.dart';

class HomeGameWidget extends StatelessWidget {
  final String text, image;
  final void Function() onTap;
  const HomeGameWidget(
      {super.key,
      required this.text,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.title16.copyWith(color: Colors.white),
        ),
        verticalSpace(10),
        InkWell(
          onTap: onTap,
          child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(image)),
        ),
      ],
    );
  }
}
