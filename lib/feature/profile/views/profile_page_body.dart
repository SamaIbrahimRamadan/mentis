import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/custom_list_tile.dart';
import 'package:mentis/feature/profile/widget/custom_profile_widget.dart';
import 'package:mentis/res.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/routing/routing.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(50),
            const Center(
              child: Text(
                "My profile ",
                style: Styles.title20,
              ),
            ),
            verticalSpace(30),
            Row(children: [
              horizontalSpace(50),
              CircleAvatar(
                maxRadius: 30,
                child: Image.asset(
                  Res.profile,
                ),
              ),
              const CustomTextTile(text: "Sama", text2: "Sama@gmail.com"),
            ]),
            verticalSpace(30),
            CustomProfileWidget(
              text: "Profile Settings",
              icon: Icons.settings_outlined,
              icons2: Icons.arrow_forward_ios,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kEditProfile);
              },
            ),
            const CustomProfileWidget(
              text: "Notifications",
              icon: Icons.notifications,
            ),
            const CustomProfileWidget(
              text: "Log out ",
              icon: Icons.login,
            )
          ],
        ),
      ),
    );
  }
}
