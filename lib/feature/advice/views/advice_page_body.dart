import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/logo_text.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/widget/button.dart';
import '../../../res.dart';

class AdvicePageBody extends StatelessWidget {
  const AdvicePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(50),
          CustomLogoText(
              y: 150,
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kHome);
              }),
          verticalSpace(20),
          const Text('The Advice', style: Styles.title20),
          verticalSpace(15),
          Image.asset(Res.advice2),
          verticalSpace(20),
          const Text('The Advice', style: Styles.title18),
          verticalSpace(10),
          Text(
            "Try to avoid the word 'but' when faced \n with a conflict Be constructive ",
            textAlign: TextAlign.center,
            style: Styles.title14.copyWith(color: ColorManger.lighterGray),
          ),
          verticalSpace(15),
          CustomButton(
              text: 'Take the advice',
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kTakeAdvice);
              },
              horizontal: 100,
              vertical: 15),
        ],
      ),
    );
  }
}
