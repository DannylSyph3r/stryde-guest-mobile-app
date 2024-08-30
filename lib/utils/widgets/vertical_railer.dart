import 'package:flutter/material.dart';

class VerticalRailer extends StatelessWidget {
  const VerticalRailer({
    super.key,
    this.top,
    this.middle,
    this.bottom,
    required this.columnPadding,
  });

  final Widget? top;
  final Widget? middle;
  final Widget? bottom;
  final EdgeInsetsGeometry columnPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: columnPadding,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              widthFactor: 1,
              child: top,
            ),
          ),
          if (middle != null) middle!,
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              widthFactor: 1,
              child: bottom,
            ),
          ),
        ],
      ),
    );
  }
}
