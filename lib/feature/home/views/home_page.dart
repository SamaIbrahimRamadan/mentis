import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/widget/app_bg.dart';
import 'package:mentis/feature/home/widget/custom_home_image_text.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widget/button.dart';
import '../../../res.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBg(
      title: '',
      child: SingleChildScrollView(
        child: Column(
          children: [
            40.sbH,
            Stack(
              children: [
                Image.asset(Res.image),
                CustomButton(
                  text: 'Doctor',
                  onPressed: () {
                    NamedNavigatorImpl.pushNamed(Routes.kDoctorHome);
                  },
                  horizontal: 20,
                  vertical: 10,
                  color: Colors.white,
                  color2: ColorManger.mainColor,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 600,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  15.sbH,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('More ', style: Styles.title20),
                      ),
                    ],
                  ),
                  15.sbH,
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
                  15.sbH,
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
            )
          ],
        ),
      ),
    );
  }
}
