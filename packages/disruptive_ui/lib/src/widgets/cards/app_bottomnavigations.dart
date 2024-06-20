import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomBottomNavigationIcon extends StatelessWidget {
  const CustomBottomNavigationIcon({
    super.key,
    required this.text,
    required this.iconBlack,
  });
  final String iconBlack;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconBlack,
              package: 'elektra_ui',
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
                fontSize: 9,
                color: AppColors.blackText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
