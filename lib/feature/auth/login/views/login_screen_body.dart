import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/feature/auth/login/widgets/custom_login_text.dart';
import 'package:mentis/feature/auth/login/widgets/custom_login_text_field.dart';
import 'package:mentis/res.dart';

import '../../../../core/routing/routing.dart';
import '../../../../core/widget/button.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final controller = TextEditingController();
    final controllerPass = TextEditingController();
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(30),
              Image.asset(Res.login),
              CustomLoginTextField(
                controller: controller,
                controllerPass: controllerPass,
              ),
              CustomButton(
                  text: "Login",
                  horizontal: 140,
                  vertical: 13,
                  onPressed: () async {
                    GoRouter.of(context).push(AppRouter.kHome);
                  }),
              const CustomLoginText(),
            ],
          ),
        ),
      ),
    );
  }
}
