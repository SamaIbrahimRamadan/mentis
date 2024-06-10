import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/theme/color.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/routing/routing.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';
import '../model/letter_model.dart';
import '../widgets/letter_widget.dart';

class LearnLetterPageBody extends StatefulWidget {
  const LearnLetterPageBody({super.key});

  @override
  State<LearnLetterPageBody> createState() => _LearnLetterPageBodyState();
}

class _LearnLetterPageBodyState extends State<LearnLetterPageBody> {
  @override
  Widget build(BuildContext context) {
    bool isLast = false;
    var control = PageController();
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(40),
          Row(
            children: [
              horizontalSpace(10),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kGame);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              horizontalSpace(100),
              Text(
                "Letter",
                style: Styles.title20.copyWith(),
              ),
              horizontalSpace(80),
              Image.asset(
                Res.img,
                width: 60,
                height: 70,
              ),
            ],
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == modelListLetter.length - 1) {
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
              itemCount: modelListLetter.length,
              //boarding.length,
              itemBuilder: (context, index) => LetterWidget(
                model: modelListLetter[index],
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
        ],
      ),
    );
  }
}
