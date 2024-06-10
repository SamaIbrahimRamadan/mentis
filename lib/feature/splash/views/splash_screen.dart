import 'package:flutter/material.dart';
import 'package:mentis/feature/splash/views/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashScreenBody()),
    );
  }
}
