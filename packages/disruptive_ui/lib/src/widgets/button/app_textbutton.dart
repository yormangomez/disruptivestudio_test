import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final TextAlign? textAlign;

  const CustomTextButton({
    super.key,
    this.textColor,
    this.textAlign,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
            fontSize: 13,
            color: textColor ?? AppColors.blueSkip,
          ),
          textAlign: textAlign ?? TextAlign.center,
        ));
  }
}
