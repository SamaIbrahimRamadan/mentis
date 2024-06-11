import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/button.dart';

import '../../../../res.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            130.sbH,
            Image.asset(Res.payment),
            20.sbH,
            const Text(
              'Congratulation',
              style: Styles.title32,
            ),
            const Text(
              'Your Payment is Successfully',
              style: Styles.title14,
            ),
            50.sbH,
            CustomButton(text: 'Back', onPressed: () {}, horizontal: 130, vertical: 10)
          ],
        ),
      ),
    );
  }
}
