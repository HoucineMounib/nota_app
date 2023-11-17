import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(
            milliseconds: 500,
          ),
          height: 12,
          width: index == currentIndex ? 32 : 12,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              color: index == currentIndex
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)),
        );
      }),
    );
  }
}
