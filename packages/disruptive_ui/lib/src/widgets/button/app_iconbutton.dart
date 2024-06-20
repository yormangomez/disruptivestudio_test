import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onPressed;
  final String image;
  final double? iconSize;
  final double? height;
  final double? width;

  const CustomIconButton({
    super.key,
    this.iconSize,
    this.height,
    this.width,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: iconSize ?? 24,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      icon: Image.asset(
        image,
        package: 'elektra_ui',
        height: height ?? 24,
        width: width ?? 24,
      ),
    );
  }
}
