import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  const CustomContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(
            Res.clock,
            width: 30,
          ),
          horizontalSpace(10),
          Text(text,
              style: Styles.title16.copyWith(fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}
