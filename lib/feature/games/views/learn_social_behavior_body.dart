import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/widget/icon_button.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/routing/routing.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';

class LearnSocialBehaviorPageBody extends StatelessWidget {
  const LearnSocialBehaviorPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          verticalSpace(40),
          Row(
            children: [
              horizontalSpace(10),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kGame);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              horizontalSpace(65),
              Text(
                "Social behavior",
                style: Styles.title20.copyWith(),
              ),
              horizontalSpace(45),
              Image.asset(
                Res.img,
                width: 60,
                height: 70,
              ),
            ],
          ),
          verticalSpace(60),
          Text(
            'Is It A Good Or Bad Habit ?',
            style: Styles.title20.copyWith(color: Colors.black),
          ),
          verticalSpace(80),
          Image.asset(
            Res.social_image,
            width: 350,
          ),
          verticalSpace(40),
          Row(
            children: [
              horizontalSpace(50),
              CustomIconButton(
                onTap: () {},
                icon: Icons.check,
                width: 70,
                height: 70,
                sizeIcon: 40,
                x: 50,
                colorBackGround: Colors.green,
              ),
              horizontalSpace(150),
              CustomIconButton(
                onTap: () {},
                icon: Icons.clear,
                width: 70,
                height: 70,
                sizeIcon: 40,
                x: 50,
                colorBackGround: Colors.red,
              ),
              horizontalSpace(50),
            ],
          )
        ],
      ),
    );
  }
}
