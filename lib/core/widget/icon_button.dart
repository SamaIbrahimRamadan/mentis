import 'package:flutter/material.dart';

import '../theme/color.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color? colorIcon, colorBackGround;
  final double? x, width, height, sizeIcon;
  const CustomIconButton(
      {super.key,
      required this.onTap,
      required this.icon,
      this.colorIcon,
      this.colorBackGround,
      this.x,
      this.width,
      this.height,
      this.sizeIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width ?? 35,
          height: height ?? 35,
          decoration: BoxDecoration(
              color: colorBackGround ?? ColorManger.mainColor,
              borderRadius: BorderRadius.circular(x ?? 10)),
          child: Icon(
            icon,
            color: colorIcon ?? Colors.white,
            size: sizeIcon ?? 25,
          )),
    );
  }
}
