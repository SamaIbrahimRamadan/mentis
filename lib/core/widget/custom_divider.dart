import 'package:flutter/material.dart';

import '../theme/color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 350,
        child: Divider(
          color: ColorManger.mainColor,
          thickness: 1.5,
        ));
  }
}
