import 'package:flutter/material.dart';

import 'main_page_body.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: MainPageScreenBody()),
    );
  }
}
