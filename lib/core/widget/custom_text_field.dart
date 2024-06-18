import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../theme/styles.dart';

class CustomTextField extends StatelessWidget {
  final InputBorder? focused;
  final InputBorder? enabled; // مش لازم ياخد قيمه كل مره
  final String? hintText;
  final bool? isObscure;
  final IconData? icon2;
  final TextEditingController? controller;
  final TextInputType? type;
  final double? x;
  final void Function()? onPressed;

  const CustomTextField({
    super.key,
    this.focused,
    this.enabled,
    this.hintText,
    this.isObscure,
    this.icon2,
    this.onPressed,
    this.x,
    this.controller,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: 325,
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        obscureText: isObscure ?? false,
        style: Styles.title16,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: x ?? 20, horizontal: 20),
          isDense: true,
          filled: true,
          fillColor: Colors.white30,
          enabledBorder: enabled ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                      color: ColorManger.mainColor, width: 1.3)),
          focusedBorder: focused ??
              OutlineInputBorder(
                  // لو م دنيش قيمه دي القيمه ال default
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                      color: ColorManger.mainColor, width: 1.3)),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(icon2),
          ),
          hintText: hintText,
          hintStyle: Styles.title14
              .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        validator: (data) {
          if (data!.isEmpty) {
            return ('Invalid value');
          }
          return null;
        },
      ),
    ));
  }
}
