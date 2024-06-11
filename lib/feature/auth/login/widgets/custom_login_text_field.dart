import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widget/custom_text_field.dart';

class CustomLoginTextField extends StatefulWidget {
  final TextEditingController controller, controllerPass;
  const CustomLoginTextField({super.key, required this.controller, required this.controllerPass});

  @override
  State<CustomLoginTextField> createState() => _CustomLoginTextFieldState();
}

class _CustomLoginTextFieldState extends State<CustomLoginTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: "email",
          controller: widget.controller,
          type: TextInputType.emailAddress,
        ),
        verticalSpace(30),
        CustomTextField(
          hintText: "Password",
          icon2: Icons.visibility_off,
          controller: widget.controllerPass,
          type: TextInputType.visiblePassword,
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          isObscure: isObscure,
        ),
        verticalSpace(10),
        Container(
          margin: const EdgeInsets.only(left: 200),
          child: GestureDetector(
            onTap: () {
              NamedNavigatorImpl.pushNamed(Routes.kRecoverPass);
            },
            child: const Text(
              "Recover password",
              style: Styles.title14,
            ),
          ),
        ),
        verticalSpace(30),
      ],
    );
  }
}
