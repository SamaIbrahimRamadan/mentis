import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/logo_text.dart';
import 'package:mentis/feature/advice/widget/custom_container.dart';
import 'package:mentis/feature/advice/widget/mange_mood_section.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../res.dart';
import '../../advice/widget/mange_mood_section_two.dart';

class MangeMoodAdviceBody extends StatelessWidget {
  const MangeMoodAdviceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.sbH,
              CustomLogoText(
                  z: 30,
                  x: 40,
                  text: 'Mange Mood',
                  onPressed: () {
                    NamedNavigatorImpl.pushNamed(Routes.kTakeAdvice);
                  }),
              SizedBox(
                height: 600,
                child: Stack(
                  children: [
                    Image.asset(
                      Res.message,
                      width: 350,
                      height: 320,
                    ),
                    const Positioned(
                      left: 90,
                      top: 55,
                      child: CustomContainer(
                        text: 'Mange Moods',
                      ),
                    ),
                    Positioned(
                        top: 105,
                        left: 50,
                        child: Text(
                          'One kid’s feelings may spiral out of \n control when they’re upset Others\n may have trouble finding the \n motivation to do something \n that  does n’t interest them.',
                          style: Styles.title16.copyWith(color: Colors.white),
                        )),
                    const MangeMoodSection()
                  ],
                ),
              ),
              MangeMoodSectionTwo()
            ],
          ),
        ),
      ),
    );
  }
}
