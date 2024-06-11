import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/widget/icon_button.dart';
import 'package:mentis/feature/doctor/views/doctor_notification/widgets/list_view_item_circle_avatar.dart';

import '../../../../../core/navigator/named_navigator_impl.dart';
import '../../../../../core/navigator/named_navigator_routes.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../res.dart';

class CallDoctorBody extends StatelessWidget {
  const CallDoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Res.color,
            fit: BoxFit.fill,
            width: 1000,
          ),
          const Positioned(
            left: 145,
            top: 200,
            child: CustomCircleAvatar(
              color: Colors.white,
              padding: 8,
              radius: 60,
              width: 120,
              height: 120,
            ),
          ),
          Positioned(
            left: 155,
            top: 330,
            child: Text(
              'Dr.Sara',
              style: Styles.title30.copyWith(color: Colors.black),
            ),
          ),
          Positioned(
            left: 175,
            top: 380,
            child: Text(
              'Ringing',
              style: Styles.title18.copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ),
          Positioned(
              left: 135,
              top: 680,
              child: Row(
                children: [
                  CustomIconButton(
                    onTap: () {},
                    icon: Icons.video_camera_front_outlined,
                    colorBackGround: Colors.white,
                    colorIcon: Colors.black,
                    width: 40,
                    x: 20,
                    height: 40,
                  ),
                  10.sbW,
                  CustomIconButton(
                    onTap: () {
                      NamedNavigatorImpl.pushNamed(Routes.kDoctorHome);
                    },
                    icon: Icons.call,
                    colorBackGround: Colors.red,
                    width: 40,
                    x: 20,
                    height: 40,
                  ),
                  10.sbW,
                  CustomIconButton(
                    onTap: () {},
                    icon: Icons.mic_none,
                    colorBackGround: Colors.white,
                    colorIcon: Colors.black,
                    width: 40,
                    x: 20,
                    height: 40,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
