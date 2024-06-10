import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../res.dart';
import '../helper/spacing.dart';
import '../theme/color.dart';
import '../theme/styles.dart';

class CustomLogoText extends StatelessWidget {
  final String? text, img;
  final double? x, y;
  final void Function() onPressed;
  const CustomLogoText(
      {super.key,
      this.text,
      this.img,
      required this.onPressed,
      this.x,
      this.y});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(x ?? 30),
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManger.mainColor,
          ),
          onPressed: onPressed,
        ),
        horizontalSpace(y ?? 70),
        Text(
          text ?? '',
          style: Styles.title20.copyWith(
              color: ColorManger.mainColor, fontWeight: FontWeight.bold),
        ),
        horizontalSpace(50),
        Image.asset(
          Res.img,
          width: 70,
        )
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
