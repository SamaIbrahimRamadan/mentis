import 'package:flutter/material.dart';

import '../../../../../core/theme/color.dart';
import '../../../../../res.dart';

class ListViewItemCircleAvatar extends StatelessWidget {
  const ListViewItemCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27.0),
      child: Stack(
        children: [
          const CustomCircleAvatar(),
          Positioned(
            left: 40,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(40)),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  final double? width, height, radius, padding;
  final Color? color;
  const CustomCircleAvatar(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.color,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 60,
      height: height ?? 60,
      decoration: BoxDecoration(
          border: Border.all(color: color ?? ColorManger.light, width: 2),
          borderRadius: BorderRadius.circular(radius ?? 30),
          color: ColorManger.light),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: Image.asset(
          Res.doctorImage,
          height: 50,
        ),
      ),
    );
  }
}
