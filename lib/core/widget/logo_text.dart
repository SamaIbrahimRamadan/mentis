import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';

import '../../res.dart';
import '../theme/color.dart';
import '../theme/styles.dart';

class CustomLogoText extends StatelessWidget {
  final String? text, img;
  final double? x, y, z;
  final void Function() onPressed;
  const CustomLogoText(
      {super.key,
      this.text,
      this.img,
      required this.onPressed,
      this.x,
      this.y,
      this.z});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (x ?? 30).sbW,
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManger.mainColor,
          ),
          onPressed: onPressed,
        ),
        (y ?? 70).sbW,
        Text(
          text ?? '',
          style: Styles.title20.copyWith(
              color: ColorManger.mainColor, fontWeight: FontWeight.bold),
        ),
        (z ?? 0).sbW,
        Image.asset(Res.img, width: 70)
      ],
    );
  }
}

void dialog(context, text) => AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.error,
      title: 'Error',
      desc: text,
    ).show();
