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
        70.sbH,
        const Text('Verification', style: Styles.title20),
        Text(
          'Enter the code from the sms\n we sent you',
          textAlign: TextAlign.center,
          style: Styles.title14.copyWith(fontWeight: FontWeight.normal),
        ),
        30.sbH,
        Image.asset(Res.password),
      ],
    );
  }
}
