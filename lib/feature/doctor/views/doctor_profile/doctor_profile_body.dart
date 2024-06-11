import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widget/custom_list_tile.dart';
import '../../../../res.dart';
import '../../../profile/widget/custom_profile_widget.dart';

class DoctorProfileBody extends StatelessWidget {
  const DoctorProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            50.sbH,
            const Center(
              child: Text(
                'My profile ',
                style: Styles.title20,
              ),
            ),
            30.sbH,
            Row(children: [
              50.sbW,
              CircleAvatar(
                maxRadius: 30,
                child: Image.asset(
                  Res.profile,
                ),
              ),
              const CustomTextTile(text: 'Sama', text2: 'Sama@gmail.com'),
            ]),
            30.sbH,
            CustomProfileWidget(
              text: 'Profile Settings',
              icon: Icons.settings_outlined,
              icons2: Icons.arrow_forward_ios,
              onTap: () {
                NamedNavigatorImpl.pushNamed(Routes.kEditProfile);
              },
            ),
            const CustomProfileWidget(
              text: 'Notifications',
              icon: Icons.notifications,
            ),
            const CustomProfileWidget(
              text: 'Log out ',
              icon: Icons.login,
            )
          ],
        ),
      ),
    );
  }
}
