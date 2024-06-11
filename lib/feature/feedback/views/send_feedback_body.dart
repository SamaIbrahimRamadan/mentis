import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mentis/core/widget/custom_text_field.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widget/button.dart';
import '../../../core/widget/logo_text.dart';

class SendFeedBackBody extends StatelessWidget {
  const SendFeedBackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CustomLogoText(
          x: 0,
          onPressed: () => NamedNavigatorImpl.pop(),
          text: 'FeedBack',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  50.sbH,
            //  70.sbH,
            Text(
              'How was Your Experience? ',
              style: Styles.title20.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            10.sbH,
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
                // PrintLog.e(rating);
              },
            ),
            30.sbH,
            const CustomTextField(
              hintText: 'Suggest anyThing we Can Improve..',
              x: 50,
            ),
            15.sbH,
            CustomButton(text: 'Send FeedBack', onPressed: () {}, horizontal: 110, vertical: 15),
          ],
        ),
      ),
    );
  }
}
