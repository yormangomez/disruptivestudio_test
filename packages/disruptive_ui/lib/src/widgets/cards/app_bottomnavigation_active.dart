import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomBottomNavigationActiveIcon extends StatelessWidget {
  const CustomBottomNavigationActiveIcon({
    super.key,
    required this.iconWhite,
    required this.textSelected,
    this.isSelection = false,
  });
  final String iconWhite;
  final String textSelected;
  final bool isSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconWhite,
          package: 'elektra_ui',
          width: 24,
          height: 24,
        ),
        const SizedBox(height: 4),
        Text(
          textSelected,
          style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
            fontSize: 9,
          ),
        ),
        isSelection
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: 50,
                  height: 1,
                  color: const Color(0xFFDA221C),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
