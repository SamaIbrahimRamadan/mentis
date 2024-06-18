import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/feature/auth/sign_up/widget/custom_sign_up_text_field.dart';

import '../../../../core/api/di.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/widget/conditional_builder.dart';
import '../../../../res.dart';
import '../sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController idNumber = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: BlocProvider(
        create: (context) => di<SignUpCubit>(),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              NamedNavigatorImpl.pushNamed(Routes.kHome);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Sign up success')));
            }
            if (state is SignUpError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final cubit = SignUpCubit.of(context);
            return SingleChildScrollView(
              //padding: const EdgeInsets.only(bottom: 40),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Res.signUp,
                      width: 500,
                      height: 300,
                    ),
                    CustomSignUpTextField(
                      firstName: firstName,
                      lastName: lastName,
                      password: password,
                      confirmPassword: confirmPassword,
                      email: email,
                      idNumber: idNumber,
                      phone: phone,
                    ),
                    40.sbH,
                    ConditionalBtn(
                      text: 'Sign up',
                      condition: state is SignUpLoading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          cubit.signup(
                            SignUpParams(
                              firstName: firstName.text,
                              lastName: lastName.text,
                              email: email.text,
                              phone: phone.text,
                              idNumber: idNumber.text,
                              password: password.text,
                              passwordConfirmation: confirmPassword.text,
                            ),
                          );
                        }
                      },
                    ),
                    40.sbH,
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
