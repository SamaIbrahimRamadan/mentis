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
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: ColorManger.mainColor),
                borderRadius: BorderRadius.circular(15))),
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                vertical: vertical, horizontal: horizontal)),
            backgroundColor:
                MaterialStatePropertyAll(color ?? ColorManger.mainColor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.title16.copyWith(color: color2 ?? Colors.white),
        ));
  }
}
