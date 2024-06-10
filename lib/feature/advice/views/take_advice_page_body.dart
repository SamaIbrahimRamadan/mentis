import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/feature/advice/widget/take_advice_widget.dart';

import '../../../core/routing/routing.dart';

class TakeAdviceBody extends StatelessWidget {
  const TakeAdviceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(50),
          Row(
            children: [
              horizontalSpace(30),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kAdvice);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              horizontalSpace(40),
              const Text(
                "Take Your Advice",
                style: Styles.title20,
              )
            ],
          ),
          verticalSpace(50),
          TakeAdviceWidget(
            text2: "Mange Moods",
            text:
                "Kids with ADHD have the same \n feelings as people without the \n condition Joy, anger, fear and \n sadness",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kMoodAdvice);
            },
          ),
          verticalSpace(30),
          TakeAdviceWidget(
            text2: "Explain adhd",
            text:
                "Children diagnosed with ADHD often\n don’t have the tools yet to explain\n it to others. But it’s important to be\n  open about this diagnosis",
            onTap: () {},
          ),
          verticalSpace(30),
          TakeAdviceWidget(
            text2: "In Schools",
            text:
                " It helps to be familiar with laws,\n regulations, and policies that can \n support your child",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
