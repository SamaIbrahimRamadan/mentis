import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/color.dart';
import '../../../core/widget/icon_button.dart';

class MangeMoodSectionTwo extends StatelessWidget {
  final PageController control;
  const MangeMoodSectionTwo({super.key, required this.control});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        Row(
          children: [
            horizontalSpace(40),
            CustomIconButton(
              width: 50,
              onTap: () {},
              icon: Icons.arrow_back_ios,
            ),
            horizontalSpace(230),
            CustomIconButton(
              onTap: () {},
              width: 50,
              icon: Icons.arrow_forward_ios,
            ),
          ],
        ),
        Center(
          child: SizedBox(
            width: 300,
            height: 100,
            child: SmoothPageIndicator(
              controller: control,
              count: 12,
              effect: const ExpandingDotsEffect(
                  //dotColor: Colors.ColorManger.MainColor,
                  activeDotColor: ColorManger.mainColor,
                  dotHeight: 3, //ارتفاع الشكل
                  spacing: 10, // المسافه بينهم
                  expansionFactor: 2 // حجم بتاع الي واقف عنده
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
