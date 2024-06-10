import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/widget/custom_text_field.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/routing/routing.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widget/button.dart';
import '../../../core/widget/logo_text.dart';

class SendFeedBackBody extends StatelessWidget {
  const SendFeedBackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(50),
            CustomLogoText(
              x: 0,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kFeedback);
              },
              text: 'FeedBack',
            ),
            verticalSpace(70),
            Text(
              "How was Your Experience? ",
              style: Styles.title20
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            verticalSpace(10),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            verticalSpace(30),
            const CustomTextField(
              hintText: "Suggest anyThing we Can Improve..",
              x: 50,
            ),
            verticalSpace(15),
            CustomButton(
                text: "Send FeedBack",
                onPressed: () {},
                horizontal: 110,
                vertical: 15),
          ],
        ),
      ),
    );
  }
}
