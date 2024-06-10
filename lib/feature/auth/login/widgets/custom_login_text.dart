import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/routing.dart';
import '../../../../core/theme/color.dart';
import '../../../../core/theme/styles.dart';

class CustomLoginText extends StatelessWidget {
  const CustomLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(30),
        const Text(
          "Don't have account",
          style: Styles.title14,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSignUp);
          },
          child: Text(
            "Sign up ",
            style: Styles.title14.copyWith(color: ColorManger.mainColor),
          ),
        )
      ],
    );
  }
}
