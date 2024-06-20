import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:flutter/material.dart';

class CustomPressRAButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color borderColor;

  const CustomPressRAButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.orange,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.white,
            ),
          )),
    );
  }
}
