import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/feature/tasks/models/advice_model.dart';
import 'package:mentis/feature/tasks/widgets/stress_advice_widget.dart';

import '../../../core/theme/color.dart';
import '../../../core/widget/logo_text.dart';

class AdviceStress extends StatefulWidget {
  const AdviceStress({super.key});

  @override
  State<AdviceStress> createState() => _AdviceStressState();
}

class _AdviceStressState extends State<AdviceStress> {
  @override
  Widget build(BuildContext context) {
    var control = PageController();
    bool isLast = false;
    return Scaffold(
      body: Column(
        children: [
          10.sbH,
          CustomLogoText(z: 30, x: 40, text: 'Advice Stress', onPressed: () {}),
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == modelListAdvice.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: control,
              itemCount: modelListAdvice.length,
              //boarding.length,
              itemBuilder: (context, index) => StressAdviceWidget(
                model: modelListAdvice[index],
                // onBoardingItem(boarding[index])),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 73, left: 250),
            child: FloatingActionButton(
              backgroundColor: ColorManger.mainColor,
              onPressed: () {
                if (isLast) {
                } else {
                  control.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: ColorManger.mainColor),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
