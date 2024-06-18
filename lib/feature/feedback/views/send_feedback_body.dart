import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mentis/core/navigator/named_navigator_impl.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/widget/custom_text_field.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widget/button.dart';
import '../../../res.dart';

class SendFeedBackBody extends StatelessWidget {
  const SendFeedBackBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              NamedNavigatorImpl.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorManger.mainColor,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'FeedBack',
              style: Styles.title20.copyWith(color: ColorManger.mainColor),
            ),
            Image.asset(
              Res.img,
              width: 60,
              height: 70,
            ),
          ],
        ),
        centerTitle: true,
        // automaticallyImplyLeading: isBack ?? false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.sbH,
          //  70.sbH,
          Text(
            'How was Your Experience? ',
            style: Styles.title20
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
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
          CustomButton(
              text: 'Send FeedBack',
              onPressed: () {},
              horizontal: 110,
              vertical: 15),
        ],
      ),
    );
  }
}
