import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';
import '../../../core/widget/icon_button.dart';
import '../../../res.dart';

class MangeMoodSection extends StatelessWidget {
  const MangeMoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 140,
          top: 215,
          child: CustomIconButton(
            onTap: () {},
            x: 20,
            icon: Icons.favorite_border,
            colorBackGround: Colors.white,
            colorIcon: ColorManger.mainColor,
          ),
        ),
        Positioned(
          left: 200,
          top: 215,
          child: CustomIconButton(
            onTap: () {},
            x: 20,
            icon: Icons.save_alt,
            colorBackGround: Colors.white,
            colorIcon: ColorManger.mainColor,
          ),
        ),
        Positioned(
            top: 270,
            left: 220,
            child: Image.asset(
              Res.circle2,
              width: 50,
            )),
        Positioned(
            top: 310,
            left: 250,
            child: Image.asset(
              Res.circle,
              width: 35,
            )),
        Positioned(top: 260, left: 50, child: Image.asset(Res.person))
      ],
    );
  }
}
