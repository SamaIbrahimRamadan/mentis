import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/feature/onBoarding/model/model.dart';

import '../../../core/routing/routing.dart';
import '../widget/boarding_widget.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  bool isLast = false;
  var control = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: PageView.builder(
          onPageChanged: (int index) {
            if (index == modelList.length - 1) {
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
          itemCount: modelList.length,
          //boarding.length,
          itemBuilder: (context, index) => OnBoardingWidget(
            model: modelList[index],
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
              GoRouter.of(context).push(AppRouter.kMainPage);
            } else {
              control.nextPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.fastLinearToSlowEaseIn);
            }
          },
          child: const Icon(Icons.arrow_forward),
        ),
      )
    ]);
  }
}
