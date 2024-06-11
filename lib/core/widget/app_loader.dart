import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS == true
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(color: ColorManger.mainColor),
    );
  }
}
