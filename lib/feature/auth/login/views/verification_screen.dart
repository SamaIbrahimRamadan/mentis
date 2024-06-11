import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/custom_text_field.dart';
import 'package:mentis/feature/auth/login/widgets/verification_text_image.dart';
import 'package:mentis/feature/auth/main_page/widget/custom_text_rich.dart';

import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/widget/button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
    return Scaffold(
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const CustomVerificationTextImage(),
          InkWell(
            onTap: () {
              startTimer();
            },
            child: Text(
              '00.$_start',
              style: Styles.title16,
            ),
          ),
          30.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 50, child: CustomTextField()),
              40.sbW,
              const SizedBox(width: 50, child: CustomTextField()),
              40.sbW,
              const SizedBox(width: 50, child: CustomTextField()),
              40.sbW,
              const SizedBox(width: 50, child: CustomTextField()),
            ],
          ),
          30.sbH,
          CustomButton(
            text: 'Submit',
            onPressed: () {
              NamedNavigatorImpl.pushNamed(Routes.kResetPass);
            },
            horizontal: 130,
            vertical: 10,
          ),
          30.sbH,
          const CustomRichText(text: "I didn't receive the code!", text2: 'resend')
        ]),
      ),
    );
  }
}
