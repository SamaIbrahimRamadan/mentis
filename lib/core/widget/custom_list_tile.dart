import 'package:flutter/material.dart';

import '../theme/styles.dart';

class CustomTextTile extends StatelessWidget {
  final String text, text2;
  const CustomTextTile({
    super.key,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ListTile(
        title: Text(
          text,
          style: Styles.title16.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          text2,
          style: Styles.title14,
        ),
      ),
    );
  }
}
