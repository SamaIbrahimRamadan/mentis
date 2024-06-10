import 'package:flutter/cupertino.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/styles.dart';
import '../../../../res.dart';

class CustomVerificationTextImage extends StatelessWidget {
  const CustomVerificationTextImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(70),
        const Text("Verification", style: Styles.title20),
        Text(
          "Enter the code from the sms\n we sent you",
          textAlign: TextAlign.center,
          style: Styles.title14.copyWith(fontWeight: FontWeight.normal),
        ),
        verticalSpace(30),
        Image.asset(Res.password),
      ],
    );
  }
}
