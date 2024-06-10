import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/feature/onBoarding/model/model.dart';

class OnBoardingWidget extends StatelessWidget {
  final Model model;
  const OnBoardingWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(60),
        Image.asset(
          model.image,
          width: 350,
          height: 400,
        ),
        verticalSpace(35),
        Text(
          model.text,
          textAlign: TextAlign.center,
          style: Styles.title18.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
