import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/feature/advice/widget/take_advice_widget.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';

class TakeAdvice extends StatelessWidget {
  const TakeAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          50.sbH,
          Row(
            children: [
              30.sbW,
              IconButton(
                  onPressed: () {
                    NamedNavigatorImpl.pushNamed(Routes.kAdvice);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              40.sbW,
              const Text(
                'Take Your Advice',
                style: Styles.title20,
              )
            ],
          ),
          50.sbH,
          TakeAdviceWidget(
            text2: 'Mange Moods',
            text:
                'Kids with ADHD have the same \n feelings as people without the \n condition Joy, anger, fear and \n sadness',
            onTap: () {
              NamedNavigatorImpl.pushNamed(Routes.kMoodAdvice);
            },
          ),
          30.sbH,
          TakeAdviceWidget(
            text2: 'Explain adhd',
            text:
                'Children diagnosed with ADHD often\n don’t have the tools yet to explain\n it to others. But it’s important to be\n  open about this diagnosis',
            onTap: () {},
          ),
          30.sbH,
          TakeAdviceWidget(
            text2: 'In Schools',
            text:
                ' It helps to be familiar with laws,\n regulations, and policies that can \n support your child',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
