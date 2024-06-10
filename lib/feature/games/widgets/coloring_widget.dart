import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../res.dart';

class ColoringWidget extends StatelessWidget {
  const ColoringWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(10),
        InkWell(
          child: Image.asset(
            Res.colorImage,
            width: 180,
          ),
        ),
        horizontalSpace(10),
        InkWell(
          child: Image.asset(
            Res.colorImage,
            width: 180,
          ),
        )
      ],
    );
  }
}
