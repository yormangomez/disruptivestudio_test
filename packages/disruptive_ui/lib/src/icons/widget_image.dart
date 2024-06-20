import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomImage({
    super.key,
    this.height,
    this.width,
    this.fit,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      package: 'elektra_ui',
      width: width,
      height: height,
      fit: fit,
    );
  }
}
