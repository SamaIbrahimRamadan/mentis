import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/theme/styles.dart';
import '../../../res.dart';

class ScoreWidget extends StatelessWidget {
  final String number, text;
  const ScoreWidget({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Res.colorVr, width: 350),
        Positioned(
            left: 10,
            top: 10,
            child: CustomContainer(
              number: number,
            )),
        Positioned(
          left: 90,
          top: 15,
          child: Text(
            text,
            style: Styles.title20.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          left: 90,
          top: 45,
          child: RatingBar.builder(
            initialRating: 2,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 10,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        )
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String number;
  const CustomContainer({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          border: Border.all(color: Colors.white, width: 3)),
      child: Center(
        child: Text(
          number,
          style: Styles.title38,
        ),
      ),
    );
  }
}
