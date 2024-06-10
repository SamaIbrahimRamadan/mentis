import 'package:flutter/material.dart';
import 'package:mentis/feature/auth/sign_up/views/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignUpScreenBody(),
      ),
    );
  }
}
