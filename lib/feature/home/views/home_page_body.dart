import 'package:flutter/material.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/widget/button.dart';
import 'package:mentis/feature/home/widget/custom_home_image_text.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/styles.dart';
import '../../../res.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  Res.color,
                ),
                Positioned(
                  left: 150,
                  top: 60,
                  child: Image.asset(
                    Res.logo2,
                    width: 80,
                  ),
                ),
                Positioned(top: 150, left: 40, child: Image.asset(Res.image)),
                Positioned(
                    top: 150,
                    left: 20,
                    child: CustomButton(
                      text: 'Doctor',
                      onPressed: () {
                        NamedNavigatorImpl.pushNamed(Routes.kDoctorHome);
                      },
                      horizontal: 30,
                      vertical: 10,
                      color: Colors.white,
                      color2: ColorManger.mainColor,
                    )),
                Positioned(
                  top: 430,
                  child: Container(
                    width: 500,
                    height: 600,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, right: 400),
                          child: const Text('More ', style: Styles.title20),
                        ),
                        CustomHomeWidget(
                          text3: 'Score',
                          text2: 'Vr Score',
                          text: 'Look At Score Vr',
                          image: Res.vr,
                          x: 40,
                          onTap: () {
                            NamedNavigatorImpl.pushNamed(Routes.kVrScore);
                          },
                        ),
                        CustomHomeWidget(
                          text3: 'advice',
                          text2: ' Do You Want Some Advice ',
                          text: 'Take Some Advice',
                          image: Res.advice,
                          onTap: () {
                            NamedNavigatorImpl.pushNamed(Routes.kAdvice);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
