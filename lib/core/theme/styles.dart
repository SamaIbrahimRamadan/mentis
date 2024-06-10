import 'package:flutter/material.dart';
import 'package:mentis/core/theme/color.dart';

// file all style in app
abstract class Styles {
  static const title16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const title32 = TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, color: ColorManger.mainColor);
  static const title24 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: ColorManger.mainColor);
  static const title20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorManger.mainColor,
  );
  static const title14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const title38 =
      TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white);
  static const title12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: ColorManger.mainColor,
  );
  static const title13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: ColorManger.mainColor,
  );
  static const title18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorManger.mainColor,
  );
  static const title30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: ColorManger.mainColor,
  );
  static const title22 =
      TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w400);
}
