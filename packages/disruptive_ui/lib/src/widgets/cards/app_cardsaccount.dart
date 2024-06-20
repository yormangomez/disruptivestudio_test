import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CardsAccount extends StatelessWidget {
  const CardsAccount({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final String icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomIcon(
              icon: icon,
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: AppFontWeight.bold,
                color: AppColors.blackText,
              ),
            ),
            Expanded(child: Container()),
            CustomIconButton(image: AppIcons.chevronRight, onPressed: () {})
          ],
        ),
      ),
    );
  }
}
