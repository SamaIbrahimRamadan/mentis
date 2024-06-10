import 'package:flutter/material.dart';
import 'package:mentis/feature/auth/login/views/recover_pass_screen_body.dart';

class RecoverPass extends StatelessWidget {
  const RecoverPass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RecoverPassBody(),
    );
  }
}
