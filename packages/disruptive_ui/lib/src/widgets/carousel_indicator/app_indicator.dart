import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CarouselIndicatorView extends StatelessWidget {
  final int countOptions;
  final int indexSelect;

  const CarouselIndicatorView({
    Key? key,
    this.countOptions = 0,
    this.indexSelect = 0,
  }) : super(key: key);

  double _getSizeForIndex(int currentIndex) {
    if (countOptions > 3) {
      if (currentIndex == indexSelect) {
        return 8;
      } else if (currentIndex <= indexSelect + 2 &&
          currentIndex >= indexSelect - 2) {
        return 8;
      } else if (currentIndex == indexSelect + 3 ||
          currentIndex == indexSelect - 3) {
        return 6;
      } else if (currentIndex == indexSelect + 4 ||
          currentIndex == indexSelect - 4) {
        return 4;
      } else if (currentIndex > indexSelect + 4 ||
          currentIndex < indexSelect - 4) {
        return 0;
      }
    }
    return 8;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        children: [
          for (int i = 0; i < countOptions; i++)
            _CarouselPointer(
              isSelected: i == indexSelect,
              size: _getSizeForIndex(i),
            ),
        ],
      ),
    );
  }
}

class _CarouselPointer extends StatelessWidget {
  final bool isSelected;
  final double size;

  const _CarouselPointer({
    Key? key,
    required this.isSelected,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFDA221C) : AppColors.grayCircle,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
