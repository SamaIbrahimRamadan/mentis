import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widget/custom_divider.dart';

class CustomProfileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconData? icons2;
  final void Function()? onTap;
  const CustomProfileWidget(
      {super.key, required this.text, required this.icon, this.icons2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.sbH,
        Row(
          children: [
            30.sbW,
            Icon(icon),
            30.sbW,
            InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: Styles.title16.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            140.sbW,
            Icon(icons2, size: 20)
          ],
        ),
        20.sbH,
        const CustomDivider(),
      ],
    );
  }
}
