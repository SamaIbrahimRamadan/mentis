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
      {super.key,
      required this.text,
      required this.icon,
      this.icons2,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(30),
        Row(
          children: [
            horizontalSpace(30),
            Icon(icon),
            horizontalSpace(30),
            InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: Styles.title16.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            horizontalSpace(140),
            Icon(
              icons2,
              size: 20,
            )
          ],
        ),
        verticalSpace(20),
        const CustomDivider(),
      ],
    );
  }
}
