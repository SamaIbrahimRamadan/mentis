import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/feature/auth/login/login_cubit.dart';
import 'package:mentis/feature/auth/login/widgets/custom_login_text.dart';
import 'package:mentis/feature/auth/login/widgets/custom_login_text_field.dart';
import 'package:mentis/res.dart';

import '../../../../core/api/di.dart';
import '../../../../core/navigator/named_navigator_impl.dart';
import '../../../../core/navigator/named_navigator_routes.dart';
import '../../../../core/widget/conditional_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: BlocProvider(
        create: (context) => di<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              NamedNavigatorImpl.pushNamed(Routes.kHome);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Login success')));
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final cubit = LoginCubit.of(context);
            return SingleChildScrollView(
              child: Center(
                child: Form(
                  key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      30.sbH,
                      Image.asset(Res.login),
                      CustomLoginTextField(controller: controller, controllerPass: controllerPass),
                      ConditionalBtn(
                        condition: state is LoginLoading,
                        text: 'Login',
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            cubit.login(
                              email: controller.text,
                              password: controllerPass.text,
                            );
                          }
                        },
                      ),
                      const CustomLoginText(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
