import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/custom_text_field.dart';
import 'package:mentis/feature/auth/login/widgets/verification_text_image.dart';
import 'package:mentis/feature/auth/main_page/widget/custom_text_rich.dart';

import '../../../../core/routing/routing.dart';
import '../../../../core/widget/button.dart';

class VerificationScreenBody extends StatefulWidget {
  const VerificationScreenBody({super.key});

  @override
  State<VerificationScreenBody> createState() => _VerificationScreenBodyState();
}

class _VerificationScreenBodyState extends State<VerificationScreenBody> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const CustomVerificationTextImage(),
        InkWell(
          onTap: () {
            startTimer();
          },
          child: Text(
            "00.$_start",
            style: Styles.title16,
          ),
        ),
        verticalSpace(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 50, child: CustomTextField()),
            horizontalSpace(40),
            const SizedBox(width: 50, child: CustomTextField()),
            horizontalSpace(40),
            const SizedBox(width: 50, child: CustomTextField()),
            horizontalSpace(40),
            const SizedBox(width: 50, child: CustomTextField()),
          ],
        ),
        verticalSpace(30),
        CustomButton(
          text: "Submit",
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kResetPass);
          },
          horizontal: 130,
          vertical: 10,
        ),
        verticalSpace(30),
        const CustomRichText(
            text: "I didn't receive the code!", text2: "resend")
      ]),
    );
  }
}
