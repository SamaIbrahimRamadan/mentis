import 'package:flutter/material.dart';
import 'package:mentis/feature/games/widgets/home_game_widget.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/widget/app_bg.dart';
import '../../../res.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBg(
      title: 'Games',
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              HomeGameWidget(
                text: 'Learn Color',
                image: Res.learnColor,
                onTap: () {
                  NamedNavigatorImpl.pushNamed(Routes.kLearnColor);
                },
              ),
              HomeGameWidget(
                text: 'Learn Letter',
                image: Res.learnLetter,
                onTap: () {
                  NamedNavigatorImpl.pushNamed(Routes.kLearnLetter);
                },
              ),
              HomeGameWidget(
                text: 'Social behaviour ',
                image: Res.puzzle,
                onTap: () {
                  NamedNavigatorImpl.pushNamed(Routes.kLearnSocialBehavior);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
