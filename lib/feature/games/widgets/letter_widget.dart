import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/models/letter_model.dart';

class LetterWidget extends StatelessWidget {
  final LetterModelData model;
  const LetterWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        60.sbH,
        Image.asset(
          model.image ?? '',
          width: 350,
          height: 400,
        ),
        // 35.sbH,
        /* Text(
          model.text,
          textAlign: TextAlign.center,
          style: Styles.title30.copyWith(),
        ),*/
      ],
    );
  }
}
