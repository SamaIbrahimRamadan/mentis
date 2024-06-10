import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';

import '../../../core/widget/custom_list_tile.dart';

class CustomImageFeedback extends StatelessWidget {
  final String text, image;
  const CustomImageFeedback(
      {super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(30),
        Image.asset(
          image,
          width: 40,
        ),
        CustomTextTile(
          text: text,
          text2: "Your Daily mental health Coach",
        )
      ],
    );
  }
}
