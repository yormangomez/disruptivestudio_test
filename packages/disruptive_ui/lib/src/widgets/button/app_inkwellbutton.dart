import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomPressButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color containerColor;

  const CustomPressButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: AppColors.greenBorder,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.blackText,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
