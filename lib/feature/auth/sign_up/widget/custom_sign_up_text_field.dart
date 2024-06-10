import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/widget/custom_text_field.dart';

class CustomSignUpTextField extends StatefulWidget {
  final TextEditingController controller, controllerPass;
  const CustomSignUpTextField(
      {super.key, required this.controller, required this.controllerPass});

  @override
  State<CustomSignUpTextField> createState() => _CustomSignUpTextFieldState();
}

class _CustomSignUpTextFieldState extends State<CustomSignUpTextField> {
  bool isObscure = true;
  bool isObscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                width: 150,
                child: CustomTextField(
                  hintText: "Name",
                  type: TextInputType.name,
                )),
            horizontalSpace(15),
            const SizedBox(
                width: 160,
                child:
                    CustomTextField(hintText: "last", type: TextInputType.name))
          ],
        ),
        verticalSpace(15),
        CustomTextField(
          hintText: "email",
          type: TextInputType.emailAddress,
          controller: widget.controller,
        ),
        verticalSpace(15),
        const CustomTextField(
            hintText: "Id number", type: TextInputType.number),
        verticalSpace(15),
        CustomTextField(
          hintText: "Password",
          controller: widget.controllerPass,
          type: TextInputType.visiblePassword,
          icon2: Icons.visibility_off,
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          isObscure: isObscure,
        ),
        verticalSpace(15),
        CustomTextField(
          hintText: "Confirm Password",
          icon2: Icons.visibility_off,
          onPressed: () {
            setState(() {
              isObscure2 = !isObscure2;
            });
          },
          isObscure: isObscure2,
        ),
      ],
    );
  }
}
