import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';

import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/theme/color.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../res.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          80.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              30.sbW,
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: ColorManger.mainColor,
                onPressed: () {
                  NamedNavigatorImpl.pushNamed(Routes.kVerification);
                },
              ),
              40.sbW,
              Text('Recover Password',
                  style: Styles.title16.copyWith(color: ColorManger.mainColor)),
            ],
          ),
          Image.asset(Res.reset),
          Container(
            margin: const EdgeInsets.only(right: 200),
            child: const Text(
              'Old Password',
              style: Styles.title14,
            ),
          ),
          const SizedBox(width: 290, child: CustomTextField()),
          15.sbH,
          Container(
            margin: const EdgeInsets.only(right: 200),
            child: const Text(
              'New Password',
              style: Styles.title14,
            ),
          ),
          const SizedBox(width: 290, child: CustomTextField()),
          15.sbH,
          Container(
            margin: const EdgeInsets.only(right: 180),
            child: const Text(
              'Reseat Password',
              style: Styles.title14,
            ),
          ),
          const SizedBox(width: 290, child: CustomTextField()),
          40.sbH,
          CustomButton(
            text: 'Recover',
            onPressed: () {
              NamedNavigatorImpl.pushNamed(Routes.kVerification);
            },
            horizontal: 120,
            vertical: 10,
          ),
        ],
      ),
    );
  }
}
