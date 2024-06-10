import 'package:flutter/material.dart';
import 'package:mentis/feature/auth/login/views/verification_screen_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: VerificationScreenBody()),
    );
  }
}
