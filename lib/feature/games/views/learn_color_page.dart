import 'package:flutter/material.dart';

import '../../../core/widget/app_bg.dart';
import '../../../res.dart';

class LearnColorPage extends StatelessWidget {
  const LearnColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBg(
      title: 'Colors',
      isBack: true,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: 10,
        itemBuilder: (c, i) => Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(Res.colorImage, width: 180),
        ),
        // const ColoringWidget(),
      ),
    );
  }
}
