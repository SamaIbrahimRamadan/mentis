import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widget/icon_button.dart';
import '../../../res.dart';
import 'custom_container.dart';

class TakeAdviceWidget extends StatelessWidget {
  final String? text2;
  final String text;
  final void Function()? onTap;
  const TakeAdviceWidget(
      {super.key, required this.text, this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Stack(
        children: [
          Image.asset(
            Res.color2,
            width: 350,
          ),
          Positioned(
            left: 230,
            top: 20,
            child: CustomIconButton(
              onTap: () {},
              x: 20,
              icon: Icons.favorite_border,
              colorBackGround: Colors.white,
              colorIcon: ColorManger.mainColor,
            ),
          ),
          Positioned(
            left: 280,
            top: 20,
            child: CustomIconButton(
              onTap: () {},
              x: 20,
              icon: Icons.save_alt,
              colorBackGround: Colors.white,
              colorIcon: ColorManger.mainColor,
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: CustomContainer(
                text: text2 ?? '',
              )),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              text,
              style: Styles.title18
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
