import 'dart:ui';

import 'package:flutter/material.dart';

class ShadowIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color shadowColor;

  const ShadowIcon({Key key, this.icon, this.shadowColor = Colors.black, this.iconColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shadow
        Positioned(
          left: -1,
          top: -1,
          child: Icon(
            icon,
            color: shadowColor,
          ),
        ),
        // Front icon
        Icon(
          icon,
          color: iconColor,
        ),
      ],
    );
  }
}
