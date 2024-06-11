import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/widget/custom_text_field.dart';

class CustomSignUpTextField extends StatefulWidget {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final TextEditingController email;
  final TextEditingController idNumber;
  final TextEditingController phone;

  const CustomSignUpTextField({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
    required this.email,
    required this.idNumber,
    required this.phone,
  });

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
            SizedBox(
              width: 150,
              child: CustomTextField(
                hintText: 'Name',
                type: TextInputType.name,
                controller: widget.firstName,
              ),
            ),
            15.sbW,
            SizedBox(
              width: 160,
              child: CustomTextField(
                hintText: 'last',
                type: TextInputType.name,
                controller: widget.lastName,
              ),
            )
          ],
        ),
        15.sbH,
        CustomTextField(
          hintText: 'Phone',
          type: TextInputType.phone,
          controller: widget.phone,
        ),
        15.sbH,
        CustomTextField(
          hintText: 'Id number',
          type: TextInputType.number,
          controller: widget.idNumber,
        ),
        15.sbH,
        CustomTextField(
          hintText: 'email',
          type: TextInputType.emailAddress,
          controller: widget.email,
        ),
        15.sbH,
        CustomTextField(
          hintText: 'Password',
          controller: widget.password,
          type: TextInputType.visiblePassword,
          icon2: Icons.visibility_off,
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          isObscure: isObscure,
        ),
        15.sbH,
        CustomTextField(
          hintText: 'Confirm Password',
          icon2: Icons.visibility_off,
          controller: widget.confirmPassword,
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
