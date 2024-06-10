import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';

class CustomTexFieldFeedback extends StatelessWidget {
  final IconData? icon2;
  final String text;
  const CustomTexFieldFeedback({super.key, this.icon2, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(icon2),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              hintText: text,
              hintStyle: Styles.title16,
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorManger.mainColor)))),
    );
  }
}
