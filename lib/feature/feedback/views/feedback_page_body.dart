import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/button.dart';
import 'package:mentis/feature/feedback/widget/custom_image_feedback.dart';

import '../../../core/routing/routing.dart';
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
            verticalSpace(50),
            Row(
              children: [
                horizontalSpace(180),
                const Text("More", style: Styles.title20),
                horizontalSpace(50),
                Image.asset(
                  Res.img,
                  width: 70,
                )
              ],
            ),
            verticalSpace(20),
            const CustomTexFieldFeedback(
              text: 'Get help',
              icon2: Icons.arrow_forward_ios,
            ),
            verticalSpace(40),
            const CustomTexFieldFeedback(
              text: 'See Terms and Privacy',
              icon2: Icons.arrow_forward_ios,
            ),
            verticalSpace(60),
            CustomButton(
                text: "FeedBack",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSendFeedback);
                },
                horizontal: 130,
                vertical: 15),
            verticalSpace(40),
            Container(
              margin: const EdgeInsets.only(right: 80),
              child: const Text(
                "Other App From the Developer",
                style: Styles.title18,
              ),
            ),
            verticalSpace(20),
            const CustomImageFeedback(text: "Depression App", image: Res.app),
            const CustomImageFeedback(text: "Anxiety App", image: Res.app2),
            const CustomImageFeedback(text: "Bipolar App", image: Res.app3),
            const CustomImageFeedback(text: "PTSD App", image: Res.app4)
          ],
        ),
      ),
    ));
  }
}
