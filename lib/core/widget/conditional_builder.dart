import 'package:flutter/material.dart';

import 'button.dart';

class ConditionalBuilder extends StatelessWidget implements PreferredSizeWidget {
  final bool condition;
  final WidgetBuilder builder;
  final WidgetBuilder? fallback;

  const ConditionalBuilder({
    super.key,
    required this.condition,
    required this.builder,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return condition
        ? builder(context)
        : fallback != null
            ? fallback!(context)
            : const SizedBox.shrink();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ConditionalBtn extends StatelessWidget implements PreferredSizeWidget {
  final bool condition;
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;

  const ConditionalBtn({
    super.key,
    required this.condition,
    required this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return condition
        ? const Center(child: CircularProgressIndicator())
        : CustomButton(
            text: text,
            onPressed: onPressed,
            horizontal: 140,
            vertical: 13,
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
