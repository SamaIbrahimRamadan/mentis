import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';

import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/widget/button.dart';
import '../../../../res.dart';

class RecoverPass extends StatelessWidget {
  const RecoverPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          30.sbH,
          Image.asset(Res.recover),
          Row(
            children: [
              50.sbW,
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  NamedNavigatorImpl.pushNamed(Routes.kLogin);
                },
              ),
              40.sbW,
              Text(
                'Recover Password',
                style: Styles.title20.copyWith(color: Colors.black),
              ),
            ],
          ),
          22.sbH,
          Text(
            'Lorem ipsum dolor sit amet, consecrated advising\n elite ut aliquot, purus sit amet lusts venerates',
            textAlign: TextAlign.center,
            style: Styles.title12.copyWith(color: ColorManger.lighterGray),
          ),
          42.sbH,
          SizedBox(
            width: 280,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email or Phone Number',
                hintStyle: Styles.title14.copyWith(color: ColorManger.lighterGray),
              ),
            ),
          ),
          80.sbH,
          CustomButton(
            text: 'Continue',
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
