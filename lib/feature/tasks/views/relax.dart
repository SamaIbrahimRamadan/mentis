import 'package:flutter/material.dart';
import 'package:mentis/core/theme/styles.dart';

import '../../../res.dart';

class RelaxPage extends StatelessWidget {
  const RelaxPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Res.reset),
            const Text(
              'Relax',
              style: Styles.title20,
            )
          ],
        ),
      ),
    );
  }
}
