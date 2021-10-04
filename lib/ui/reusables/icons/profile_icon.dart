import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shadow_icon.dart';

class ProfileIcon extends StatelessWidget {

  final double size;

  const ProfileIcon({Key? key, this.size = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'profile',
      child: ShadowIcon(
        icon: Icons.person,
        shadowColor: Colors.black,
        iconColor: Colors.white,
        iconSize: size,
      ),
    );
  }

}