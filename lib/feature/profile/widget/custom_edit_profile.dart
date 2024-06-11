import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';

class CustomEditProfile extends StatelessWidget {
  final String text;
  final double? x;
  const CustomEditProfile({super.key, required this.text, this.x});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        30.sbW,
        Text(
          text,
          style: Styles.title16,
        ),
        (x ?? 200).sbW,
        const Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: ColorManger.mainColor,
        ),
      ],
    );
  }
}
