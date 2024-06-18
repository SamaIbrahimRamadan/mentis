import 'dart:async';

import 'package:flutter/material.dart';

const targetColors = [Colors.orange, Colors.green, Colors.yellow, Colors.blue];
const textColors = [Colors.blue, Colors.yellow, Colors.green, Colors.orange];
const colorNames = ['orange', 'green', 'yellow', 'blue'];

enum TargetType { color, number }

class RandomGameTargetData {
  RandomGameTargetData({required this.type, required this.index});
  final TargetType type;
  final int index;

  String get text => type == TargetType.color ? 'COLOR ${colorNames[index]}' : 'NUMBER $index';
  Color get color => textColors[index];
}

class GameTimer {
  Timer? _timer;
  ValueNotifier<int> remainingSeconds = ValueNotifier<int>(10);

  void startGame() {
    _timer?.cancel();
    remainingSeconds.value = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingSeconds.value--;
      if (remainingSeconds.value == 0) {
        _timer?.cancel();
      }
    });
  }
}
