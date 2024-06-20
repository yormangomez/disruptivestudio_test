import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final TextStyle? style;
  final Widget? child;
  final double? fontSize;

  const CustomButton({
    super.key,
    this.backgroundColor,
    this.borderSideColor,
    this.textColor,
    this.style,
    this.child,
    this.text,
    this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.redText,
          border: Border.all(
            color: borderSideColor ?? AppColors.redText,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: child ??
              Center(
                child: Text(
                  text ?? '',
                  style: style ??
                      UITextStyle.paragraphs.paragraph1Regular.copyWith(
                        color: textColor ?? AppColors.white,
                        fontSize: fontSize ?? 16,
                      ),
                ),
              ),
        ),
      ),
    );
  }
}
