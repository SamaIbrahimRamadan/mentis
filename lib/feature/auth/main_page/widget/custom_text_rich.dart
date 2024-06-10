import 'package:flutter/material.dart';

import '../../../../core/theme/styles.dart';

class CustomRichText extends StatelessWidget {
  final String text, text2;
  const CustomRichText({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: text,
            style: Styles.title14
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal)),
        TextSpan(
            text: text2, style: Styles.title14.copyWith(color: Colors.black)),
      ]),
    );
  }
}
