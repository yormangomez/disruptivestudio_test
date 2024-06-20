import 'package:flutter/material.dart';

class HeartButtonPLP extends StatefulWidget {
  final void Function() onPressed;
  final String image;
  final double? iconSize;

  const HeartButtonPLP({
    super.key,
    this.iconSize,
    required this.image,
    required this.onPressed,
  });

  @override
  State<HeartButtonPLP> createState() => _HeartButtonPdpState();
}

class _HeartButtonPdpState extends State<HeartButtonPLP> {
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
        height: 16,
        width: 16,
      ),
    );
  }
}
