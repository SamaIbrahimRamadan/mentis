import 'package:flutter/material.dart';
import 'package:mentis/feature/tasks/models/advice_model.dart';

import '../../../core/theme/styles.dart';
import '../../../res.dart';
import '../../advice/widget/custom_container.dart';
import '../../advice/widget/mange_mood_section.dart';

class StressAdviceWidget extends StatelessWidget {
  final ModelAdvice model;

  const StressAdviceWidget({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 600,
          child: Stack(
            children: [
              Image.asset(
                Res.message,
                width: 340,
                height: 320,
              ),
              const Positioned(
                left: 90,
                top: 55,
                child: CustomContainer(
                  text: 'Mange Stress',
                ),
              ),
              Positioned(
                  top: 110,
                  left: 33,
                  child: Text(
                    model.text,
                    style: Styles.title14.copyWith(color: Colors.white),
                  )),
              const MangeMoodSection()
            ],
          ),
        ),
      ],
    );
  }
}
