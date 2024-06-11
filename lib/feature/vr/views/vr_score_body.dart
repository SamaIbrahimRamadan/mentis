import 'package:flutter/material.dart';
import 'package:mentis/feature/vr/widget/score_widget.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';

class VrScoreBody extends StatelessWidget {
  const VrScoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          30.sbH,
          Row(
            children: [
              10.sbW,
              IconButton(
                  onPressed: () {
                    NamedNavigatorImpl.pushNamed(Routes.kHome);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManger.mainColor,
                  )),
              65.sbW,
              Text(
                'virtual activities',
                style: Styles.title20.copyWith(),
              ),
              45.sbW,
              Image.asset(
                Res.img,
                width: 60,
                height: 70,
              ),
            ],
          ),
          40.sbH,
          const ScoreWidget(number: '0', text: 'Score:80%'),
          30.sbH,
          const ScoreWidget(number: '1', text: 'Score:50%'),
          30.sbH,
          Container(
            width: 350,
            height: 90,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorManger.darkGrey),
            child: Row(
              children: [
                10.sbW,
                Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(color: Colors.white, width: 3)),
                    child: const Center(
                        child: Icon(
                      Icons.lock_outline,
                      size: 30,
                      color: Colors.white,
                    ))),
                10.sbW,
                Text(
                  'poss level 0&1 above to unlock',
                  style: Styles.title16.copyWith(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
