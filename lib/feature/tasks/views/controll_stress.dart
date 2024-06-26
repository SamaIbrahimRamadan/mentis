import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widget/button.dart';
import '../../../res.dart';

class ControlStress extends StatelessWidget {
  const ControlStress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Res.reset),
            const Text(
              'Stress',
              style: Styles.title20,
            ),
            15.sbH,
            const Text(
              'How to Control Stress',
              style: Styles.title14,
            ),
            15.sbH,
            CustomButton(
              text: 'Communicate with Dr',
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kDoctorHome);
              },
              horizontal: 40,
              vertical: 15,
            ),
            15.sbH,
            CustomButton(
              text: 'Take Advice',
              onPressed: () {
                NamedNavigatorImpl.pushNamed(Routes.kStressAdvice);
              },
              horizontal: 80,
              vertical: 15,
            ),
          ],
        ),
      ),
    );
  }
}
