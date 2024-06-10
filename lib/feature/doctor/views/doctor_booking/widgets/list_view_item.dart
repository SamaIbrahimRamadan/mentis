import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/color.dart';
import '../../../../../core/theme/styles.dart';

class ListViewItem extends StatelessWidget {
  final String text;
  const ListViewItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: ColorManger.light,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            text,
            style: Styles.title18
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ))),
    );
  }
}

class TextItem extends StatelessWidget {
  final String text;
  final double? x;
  const TextItem({super.key, required this.text, this.x});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(10),
        Text(text, style: Styles.title18.copyWith(color: Colors.black)),
        horizontalSpace(x ?? 200),
        Text("See All", style: Styles.title18.copyWith(color: Colors.black)),
      ],
    );
  }
}
