import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shadow_icon.dart';

class ProfileIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'profile',
      child: ShadowIcon(
        icon: Icons.person,
        shadowColor: Colors.black,
        iconColor: Colors.white,
      ),
    );
  }

}