import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final BorderSide? side;
  final String icon;

  const CustomLoginButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.side,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 5,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 6,
        ),
        side: side,
      ), //
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIcon(
              icon: icon,
              height: 24,
              width: 24,
            ),
            Expanded(child: Container()),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
                  color: textColor ?? AppColors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
