import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../model/letter_model.dart';

class LetterWidget extends StatelessWidget {
  final ModelLetter model;
  const LetterWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(60),
        Image.asset(
          model.image,
          width: 350,
          height: 400,
        ),
        verticalSpace(35),
        /* Text(
          model.text,
          textAlign: TextAlign.center,
          style: Styles.title30.copyWith(),
        ),*/
      ],
    );
  }
}