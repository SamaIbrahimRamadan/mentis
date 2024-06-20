import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mentis/core/theme/styles.dart';
import 'package:mentis/core/widget/app_loader.dart';

import '../../../../core/api/di.dart';
import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/widget/button.dart';
import '../../../../res.dart';
import '../cubits/recover_password/recover_password_cubit.dart';

class RecoverPass extends StatefulWidget {
  const RecoverPass({super.key});

  @override
  State<RecoverPass> createState() => _RecoverPassState();
}

class _RecoverPassState extends State<RecoverPass> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<RecoverPasswordCubit>(),
        child: BlocConsumer<RecoverPasswordCubit, RecoverPasswordState>(
          listener: (context, state) {
            if (state is RecoverPasswordLoading) const AppLoader();
            if (state is RecoverPasswordSuccess) {
              NamedNavigatorImpl.pushNamed(Routes.kVerification);
            }
            if (state is RecoverPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final cubit = RecoverPasswordCubit.of(context);
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _header,
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email or Phone Number',
                          hintStyle: Styles.title14.copyWith(color: ColorManger.lighterGray),
                        ),
                        validator: (data) {
                          if (data!.isEmpty) {
                            return ('Invalid value');
                          }
                          return null;
                        },
                      ),
                    ),
                    80.sbH,
                    if (state is RecoverPasswordLoading)
                      const AppLoader()
                    else
                      CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.recoverPassword(email: emailController.text);
                          }
                        },
                        horizontal: 120,
                        vertical: 10,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget get _header {
  return Column(
    children: [
      30.sbH,
      Image.asset(Res.recover),
      Row(
        children: [
          50.sbW,
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => NamedNavigatorImpl.pop(),
          ),
          40.sbW,
          Text(
            'Recover Password',
            style: Styles.title20.copyWith(color: Colors.black),
          ),
        ],
      ),
      22.sbH,
      Text(
        'Lorem ipsum dolor sit amet, consecrated advising\n elite ut aliquot, purus sit amet lusts venerates',
        textAlign: TextAlign.center,
        style: Styles.title12.copyWith(color: ColorManger.lighterGray),
      ),
      42.sbH,
    ],
  );
}
