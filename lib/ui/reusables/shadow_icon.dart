import 'dart:ui';

import 'package:flutter/material.dart';

class ShadowIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color shadowColor;
  final double iconSize;

  const ShadowIcon({
    Key? key,
    required this.icon,
    this.shadowColor = Colors.black,
    this.iconColor = Colors.white,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Stack(
        children: [
          // Shadow
          Positioned(
            left: -1,
            top: -1,
            child: Icon(
              icon,
              color: shadowColor,
              size: iconSize,
            ),
          ),
          // Front icon
          Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ],
      ),
    );
  }
}
