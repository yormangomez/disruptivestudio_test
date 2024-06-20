import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomSecundaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderSide? side;
  final Widget? child;

  const CustomSecundaryButton({
    super.key,
    this.backgroundColor,
    this.side,
    this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0,
        padding: const EdgeInsets.all(16),
        side: side ?? const BorderSide(color: AppColors.orangeSelector),
      ), //
      child: child,
    );
  }
}
