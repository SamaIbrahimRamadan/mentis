import 'package:flutter/material.dart';

import '../../../../../core/theme/color.dart';

class CustomIcon extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color? colorIcon, colorBackGround;
  final double? x, width, height, sizeIcon;
  const CustomIcon(
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
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: ColorManger.light,
              borderRadius: BorderRadius.circular(x ?? 10)),
          child: Icon(
            icon,
            color: Colors.black,
            size: 25,
          )),
    );
  }
}
