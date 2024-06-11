import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';

import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/widget/button.dart';
import '../../../../res.dart';

class RecoverPassBody extends StatelessWidget {
  const RecoverPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(30),
        Image.asset(Res.recover),
        Row(
          children: [
            horizontalSpace(50),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kLogin);
              },
            ),
            horizontalSpace(40),
            Text(
              "Recover Password",
              style: Styles.title20.copyWith(color: Colors.black),
            ),
          ],
        ),
        verticalSpace(22),
        Text(
          "Lorem ipsum dolor sit amet, consecrated advising\n elite ut aliquot, purus sit amet lusts venerates",
          textAlign: TextAlign.center,
          style: Styles.title12.copyWith(color: ColorManger.lighterGray),
        ),
        verticalSpace(42),
        SizedBox(
          width: 280,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Email or Phone Number",
              hintStyle: Styles.title14.copyWith(color: ColorManger.lighterGray),
            ),
          ),
        ),
        verticalSpace(80),
        CustomButton(
          text: "Continue",
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
