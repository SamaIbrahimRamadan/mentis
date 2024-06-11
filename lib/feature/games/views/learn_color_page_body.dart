import 'package:flutter/material.dart';
import 'package:mentis/feature/games/widgets/coloring_widget.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';

class LearnColorPageBody extends StatelessWidget {
  const LearnColorPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Image.asset(
        Res.color,
        width: 1000,
        fit: BoxFit.fill,
      ),
      Positioned(
        top: 30,
        left: 10,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  NamedNavigatorImpl.pushNamed(Routes.kGame);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
            horizontalSpace(120),
            Text(
              "Colors ",
              style: Styles.title20.copyWith(color: Colors.white),
            ),
            horizontalSpace(60),
            Image.asset(
              Res.logo2,
              width: 60,
              height: 70,
            ),
          ],
        ),
      ),
      Positioned(
          top: 100,
          child: Column(
            children: [
              verticalSpace(30),
              const ColoringWidget(),
              verticalSpace(30),
              const ColoringWidget(),
              verticalSpace(30),
              const ColoringWidget()
            ],
          ))
    ])));
  }
}
