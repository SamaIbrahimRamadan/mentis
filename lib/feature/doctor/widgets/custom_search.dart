import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';

class CustomTextFieldSearch extends StatelessWidget {
  final InputBorder? focused;
  final InputBorder? enabled; // مش لازم ياخد قيمه كل مره
  final String? hintText;
  final bool? isObscure;
  final IconData? icon2, icons3;
  final double? x, width;
  final void Function()? onPressed, onPressed2;
  final TextEditingController? controller;
  const CustomTextFieldSearch({
    super.key,
    this.focused,
    this.enabled,
    this.hintText,
    this.isObscure,
    this.icon2,
    this.onPressed,
    this.x,
    this.icons3,
    this.onPressed2,
    this.width,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 325,
        child: TextFormField(
          controller: controller,
          obscureText: isObscure ?? false,
          enableSuggestions: true,
          style: Styles.title16,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: x ?? 20, horizontal: 20),
            isDense: true,
            filled: true,
            fillColor: ColorManger.light,
            enabledBorder: enabled ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide:
                        const BorderSide(color: ColorManger.light, width: 1.3)),
            focusedBorder: focused ??
                OutlineInputBorder(
                    // لو م دنيش قيمه دي القيمه ال default
                    borderRadius: BorderRadius.circular(7),
                    borderSide:
                        const BorderSide(color: ColorManger.light, width: 1.3)),
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(icon2),
            ),
            prefixIcon: IconButton(
              onPressed: onPressed2,
              icon: Icon(icons3),
            ),
            hintText: hintText,
            hintStyle: Styles.title14
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ));
  }
}
