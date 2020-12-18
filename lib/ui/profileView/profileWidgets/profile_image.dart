import 'package:attached/ui/reusables/icons/profile_icon.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16
          ),
          child: CircleAvatar(
            radius: 40,
            child: ProfileIcon(),
          ),
        )
      ],
    );
  }

}