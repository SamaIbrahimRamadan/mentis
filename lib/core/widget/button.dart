import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../theme/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double vertical, horizontal;
  final Color? color, color2;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.horizontal,
      required this.vertical,
      this.color,
      this.color2});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: ColorManger.mainColor),
                borderRadius: BorderRadius.circular(20))),
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                vertical: vertical, horizontal: horizontal)),
            backgroundColor:
                WidgetStatePropertyAll(color ?? ColorManger.mainColor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.title16.copyWith(color: color2 ?? Colors.white),
        ));
  }
}
