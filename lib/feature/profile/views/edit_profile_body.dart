import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/widget/logo_text.dart';
import 'package:mentis/feature/profile/widget/custom_edit_profile.dart';

import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/widget/button.dart';
import '../../../res.dart';
import '../../feedback/widget/custom_text_field_feedback.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            30.sbH,
            CustomLogoText(
                text: 'Edit Profile',
                onPressed: () {
                  NamedNavigatorImpl.pushNamed(Routes.kProfile);
                }),
            30.sbH,
            Image.asset(
              Res.profile2,
              width: 120,
            ),
            50.sbH,
            const CustomEditProfile(text: 'Email address'),
            const CustomTexFieldFeedback(
              text: 'sama11@gmail.com',
            ),
            30.sbH,
            const CustomEditProfile(
              text: 'Phone Numbers',
              x: 190,
            ),
            const CustomTexFieldFeedback(
              text: '+20 109 148 4981',
            ),
            30.sbH,
            const CustomEditProfile(
              text: 'Password',
              x: 230,
            ),
            const CustomTexFieldFeedback(
              text: 'Change Password',
            ),
            30.sbH,
            CustomButton(text: 'Save Change', onPressed: () {}, horizontal: 130, vertical: 15),
          ],
        ),
      ),
    );
  }
}
