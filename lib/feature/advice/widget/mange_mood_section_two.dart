import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/widget/icon_button.dart';

class MangeMoodSectionTwo extends StatelessWidget {
  const MangeMoodSectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.sbH,
        Row(
          children: [
            40.sbW,
            CustomIconButton(
              width: 50,
              onTap: () {},
              icon: Icons.arrow_back_ios,
            ),
            230.sbW,
            CustomIconButton(
              onTap: () {},
              width: 50,
              icon: Icons.arrow_forward_ios,
            ),
          ],
        ),
      ],
    );
  }
}
