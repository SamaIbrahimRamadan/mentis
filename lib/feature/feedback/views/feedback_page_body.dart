import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/button.dart';
import 'package:mentis/feature/feedback/widget/custom_image_feedback.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../res.dart';
import '../widget/custom_text_field_feedback.dart';

class FeedBackPageScreen extends StatelessWidget {
  const FeedBackPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            50.sbH,
            Row(
              children: [
                180.sbW,
                const Text('More', style: Styles.title20),
                50.sbW,
                Image.asset(
                  Res.img,
                  width: 70,
                )
              ],
            ),
            20.sbH,
            const CustomTexFieldFeedback(
              text: 'Get help',
              icon2: Icons.arrow_forward_ios,
            ),
            40.sbH,
            const CustomTexFieldFeedback(
              text: 'See Terms and Privacy',
              icon2: Icons.arrow_forward_ios,
            ),
            60.sbH,
            CustomButton(
                text: 'FeedBack',
                onPressed: () {
                  NamedNavigatorImpl.pushNamed(Routes.kSendFeedback);
                },
                horizontal: 130,
                vertical: 15),
            40.sbH,
            Container(
              margin: const EdgeInsets.only(right: 80),
              child: const Text(
                'Other App From the Developer',
                style: Styles.title18,
              ),
            ),
            20.sbH,
            const CustomImageFeedback(text: 'Depression App', image: Res.app),
            const CustomImageFeedback(text: 'Anxiety App', image: Res.app2),
            const CustomImageFeedback(text: 'Bipolar App', image: Res.app3),
            const CustomImageFeedback(text: 'PTSD App', image: Res.app4)
          ],
        ),
      ),
    ));
  }
}
