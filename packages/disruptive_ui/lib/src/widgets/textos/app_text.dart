import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.blackText,
        fontFamily: AppFonts.ibmPlexSansBold,
      ),
    );
  }
}
