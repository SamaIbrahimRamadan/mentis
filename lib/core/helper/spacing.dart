import 'package:flutter/cupertino.dart';

extension EmptyPadding on num {
  SizedBox get sbH => SizedBox(height: toDouble());
  SizedBox get sbW => SizedBox(width: toDouble());
}
