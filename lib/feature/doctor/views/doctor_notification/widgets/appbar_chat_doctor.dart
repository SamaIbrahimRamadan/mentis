import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/navigator/named_navigator_impl.dart';
import '../../../../../core/navigator/named_navigator_routes.dart';
import '../../../../../core/theme/color.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widget/icon_button.dart';

class AppBarChatDoctor extends StatelessWidget {
  const AppBarChatDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(30),
        IconButton(
            onPressed: () {
              NamedNavigatorImpl.pushNamed(Routes.kDoctorHome);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorManger.mainColor,
            )),
        horizontalSpace(80),
        const Text(
          "Dr.Sara",
          style: Styles.title18,
        ),
        horizontalSpace(70),
        CustomIconButton(
          onTap: () {
            NamedNavigatorImpl.pushNamed(Routes.kCallDoctor);
          },
          icon: Icons.call,
          colorIcon: Colors.black,
          colorBackGround: ColorManger.light,
          x: 15,
        ),
        horizontalSpace(10),
        CustomIconButton(
          onTap: () {},
          colorIcon: Colors.black,
          icon: Icons.video_camera_front_outlined,
          colorBackGround: ColorManger.light,
          x: 15,
        ),
      ],
    );
  }
}
