import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/styles.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../res.dart';

class LearnColorPage extends StatelessWidget {
  const LearnColorPage({super.key});

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
          body: Column(
            children: [
              20.sbH,
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        onPressed: () {
                          NamedNavigatorImpl.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    80.sbW,
                    Text(
                      'Coloring',
                      style: Styles.title20.copyWith(color: Colors.white),
                    ),
                    80.sbW,
                    Image.asset(
                      Res.logo2,
                      width: 60,
                    ),
                  ],
                ),
              ),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemCount: 6,
                itemBuilder: (c, i) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(Res.colorImage, width: 180),
                ),
                // const ColoringWidget(),
              ),
            ],
          ),
        ));
  }
}
