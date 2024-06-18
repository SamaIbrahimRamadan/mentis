import 'package:flutter/material.dart';

class RandomGameTargetWidget extends StatelessWidget {
  const RandomGameTargetWidget({
    super.key,
    required this.color,
    required this.textColor,
    required this.text,
  });
  final Color color;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class TextPrompt extends StatelessWidget {
  const TextPrompt(
    this.text, {
    super.key,
    required this.color,
    this.fontSize = 32,
  });
  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 250),
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        shadows: const [
          Shadow(
            blurRadius: 4.0,
            color: Colors.black,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: Text(text),
    );
  }
}
