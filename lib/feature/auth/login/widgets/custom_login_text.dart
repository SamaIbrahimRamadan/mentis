import 'package:flutter/cupertino.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/theme/color.dart';
import '../../../../core/theme/styles.dart';

class CustomLoginText extends StatelessWidget {
  const CustomLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.sbH,
        const Text(
          "Don't have account",
          style: Styles.title14,
        ),
        GestureDetector(
          onTap: () {
            NamedNavigatorImpl.pushNamed(Routes.kSignUp);
          },
          child: Text(
            'Sign up ',
            style: Styles.title14.copyWith(color: ColorManger.mainColor),
          ),
        )
      ],
    );
  }
}
