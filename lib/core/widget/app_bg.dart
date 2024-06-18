import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';

import '../../../core/theme/styles.dart';
import '../../../res.dart';

class AppBg extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool? isBack;

  const AppBg({super.key, this.title, required this.child, this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Res.color),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: title != null
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: [
              if (title == null) ...[
                Text(
                  title ?? '',
                  style: Styles.title20.copyWith(color: Colors.white),
                ),
                80.sbW,
              ],
              Image.asset(
                Res.logo2,
                width: 60,
                height: 70,
              ),
            ],
          ),
          centerTitle: true,
          automaticallyImplyLeading: isBack ?? false,
          backgroundColor: Colors.transparent,
        ),
        body: child,
      ),
    );
  }
}
