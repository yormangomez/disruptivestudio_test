import 'package:flutter/material.dart';

class HeartButtonPDP extends StatefulWidget {
  final void Function() onPressed;
  final String image;
  final double? iconSize;
  final double? height;
  final double? width;
  final bool isAddedToFAvorite;

  const HeartButtonPDP({
    super.key,
    this.iconSize,
    this.height,
    this.width,
    required this.image,
    required this.onPressed,
    required this.isAddedToFAvorite,
  });

  @override
  State<HeartButtonPDP> createState() => _HeartButtonPdpState();
}

class _HeartButtonPdpState extends State<HeartButtonPDP> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onPressed();
      },
      iconSize: widget.iconSize ?? 22,
      icon: Image.asset(
        widget.image,
        package: 'lacomer_ui',
        height: widget.height ?? 22,
        width: widget.width ?? 22,
      ),
    );
  }
}
