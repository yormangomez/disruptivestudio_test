import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double? height;
  final double? width;

  const CustomIcon({
    super.key,
    this.height,
    this.width,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      package: 'elektra_ui',
      width: width ?? 16,
      height: height ?? 16,
    );
  }
}
