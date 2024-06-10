import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/widget/button.dart';

import '../../../core/routing/routing.dart';
import '../../../res.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Res.color,
          fit: BoxFit.fill,
          width: 1000,
        ),
        Positioned(
          top: 180,
          left: 100,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.asset(
                Res.logo,
                width: 200,
              )),
        ),
        Positioned(
          top: 400,
          left: 60,
          child: CustomButton(
              text: "Let's Start",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kOnBoarding);
              },
              horizontal: 100,
              color: Colors.white,
              color2: ColorManger.mainColor,
              vertical: 10),
        )
      ],
    );
  }
}
