import 'package:flutter/material.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/feature/games/widgets/home_game_widget.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../res.dart';

class GamesPageBody extends StatelessWidget {
  const GamesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              Res.color,
              width: 1000,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 30,
              left: 150,
              child: Row(
                children: [
                  Text(
                    "Games",
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
                left: 40,
                child: HomeGameWidget(
                  text: "Learn Color",
                  image: Res.learnColor,
                  onTap: () {
                    NamedNavigatorImpl.pushNamed(Routes.kLearnColor);
                  },
                )),
            Positioned(
                top: 340,
                left: 40,
                child: HomeGameWidget(
                  text: "Learn Letter",
                  image: Res.learnLetter,
                  onTap: () {
                    NamedNavigatorImpl.pushNamed(Routes.kLearnLetter);
                  },
                )),
            Positioned(
                top: 580,
                left: 40,
                child: HomeGameWidget(
                  text: "Social behaviour ",
                  image: Res.puzzle,
                  onTap: () {
                    NamedNavigatorImpl.pushNamed(Routes.kLearnSocialBehavior);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
