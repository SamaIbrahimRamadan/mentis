import 'package:flutter/material.dart';
import 'package:mentis/core/widget/icon_button.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';

class LearnSocialBehaviorPage extends StatelessWidget {
  const LearnSocialBehaviorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          40.sbH,
          Row(
            children: [
              10.sbW,
              IconButton(
                  onPressed: () {
                    NamedNavigatorImpl.pushNamed(Routes.kFeedback);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              65.sbW,
              Text(
                'Social behavior',
                style: Styles.title20.copyWith(),
              ),
              45.sbW,
              Image.asset(
                Res.img,
                width: 60,
                height: 70,
              ),
            ],
          ),
          60.sbH,
          Text(
            'Is It A Good Or Bad Habit ?',
            style: Styles.title20.copyWith(color: Colors.black),
          ),
          80.sbH,
          Image.asset(
            Res.socialImage,
            width: 350,
          ),
          40.sbH,
          Row(
            children: [
              50.sbW,
              CustomIconButton(
                onTap: () {},
                icon: Icons.check,
                width: 70,
                height: 70,
                sizeIcon: 40,
                x: 50,
                colorBackGround: Colors.green,
              ),
              150.sbW,
              CustomIconButton(
                onTap: () {},
                icon: Icons.clear,
                width: 70,
                height: 70,
                sizeIcon: 40,
                x: 50,
                colorBackGround: Colors.red,
              ),
              50.sbW,
            ],
          )
        ],
      ),
    );
  }
}
