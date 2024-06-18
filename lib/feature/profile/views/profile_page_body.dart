import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/custom_list_tile.dart';
import 'package:mentis/feature/profile/widget/custom_profile_widget.dart';
import 'package:mentis/res.dart';

import '../../../core/api/di.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/local/user_preferences/user_preferences_helper.dart';
import '../../../core/navigator/named_navigator_impl.dart';
import '../../../core/navigator/named_navigator_routes.dart';
import '../../../core/widget/app_loader.dart';
import '../../../core/widget/state_conditional_builder.dart';
import '../cubit/profile_cubit.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('My Profile', style: Styles.title20)),
      body: BlocProvider(
        create: (context) => di<ProfileCubit>(),
        child: Column(
          children: [
            50.sbH,
            Row(
              children: [
                50.sbW,
                CircleAvatar(
                  maxRadius: 30,
                  child: Image.asset(
                    Res.profile,
                  ),
                ),
                const CustomTextTile(text: 'Sama', text2: 'Sama@gmail.com'),
              ],
            ),
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
            const LogOutBtn(),
          ],
        ),
      ),
    );
  }
}

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is SuccessLogoutState) {
          UserPreferencesHelper().logout();
          NamedNavigatorImpl.pushNamed(Routes.kLogin, clean: true);
        }
      },
      builder: (context, state) {
        final cubit = ProfileCubit.of(context);
        return StateConditionalBuilder(
          loadingCondition: state is LoadingLogoutState,
          loadingBuilder: (context) => const AppLoader(),
          errorBuilder: (context) {
            // return const ErrorStateWidget();
            return const Text('Error');
          },
          errorCondition: state is ErrorLogoutState,
          fallback: (context) {
            return CustomProfileWidget(
              text: 'Log out ',
              icon: Icons.login,
              onTap: () => cubit.logout(),
            );
          },
        );
      },
    );
  }
}
