import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/button.dart';
import 'package:mentis/feature/auth/main_page/widget/custom_text_rich.dart';

import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../res.dart';

class MainPageScreenBody extends StatelessWidget {
  const MainPageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Res.mobile),
        // 40.sbH,
        const Text('Welcome To ADHD', style: Styles.title20),
        40.sbH,
        CustomButton(
          text: 'create account',
          onPressed: () {
            NamedNavigatorImpl.pushNamed(Routes.kSignUp);
          },
          horizontal: 95,
          vertical: 15,
          color: Colors.white,
          color2: ColorManger.mainColor,
        ),
        40.sbH,
        CustomButton(
          text: 'Login',
          onPressed: () {
            NamedNavigatorImpl.pushNamed(Routes.kLogin);
          },
          horizontal: 130,
          vertical: 15,
        ),
        40.sbH,
        const CustomRichText(text: "I Didn't create an  account!", text2: 'Skip'),
      ],
    );
  }
}
