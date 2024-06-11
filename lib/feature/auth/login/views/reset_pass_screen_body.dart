import 'package:flutter/material.dart';
import 'package:mentis/core/theme/color.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../res.dart';

class ResetPassScreenBody extends StatelessWidget {
  const ResetPassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(80),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            horizontalSpace(30),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: ColorManger.mainColor,
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kVerification);
              },
            ),
            horizontalSpace(40),
            Text("Recover Password", style: Styles.title16.copyWith(color: ColorManger.mainColor)),
          ],
        ),
        Image.asset(Res.reset),
        Container(
          margin: const EdgeInsets.only(right: 200),
          child: const Text(
            "Old Password",
            style: Styles.title14,
          ),
        ),
        const SizedBox(width: 290, child: CustomTextField()),
        verticalSpace(15),
        Container(
          margin: const EdgeInsets.only(right: 200),
          child: const Text(
            "New Password",
            style: Styles.title14,
          ),
        ),
        const SizedBox(width: 290, child: CustomTextField()),
        verticalSpace(15),
        Container(
          margin: const EdgeInsets.only(right: 180),
          child: const Text(
            "Reseat Password",
            style: Styles.title14,
          ),
        ),
        const SizedBox(width: 290, child: CustomTextField()),
        verticalSpace(40),
        CustomButton(
          text: "Recover",
          onPressed: () {
            NamedNavigatorImpl.pushNamed(Routes.kVerification);
          },
          horizontal: 120,
          vertical: 10,
        ),
      ],
    );
  }
}
