import 'dart:typed_data';

import 'package:attached/ui/reusables/icons/profile_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final Uint8List? imageBytes;

  const ProfileImage({Key? key, this.imageBytes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2)),
          margin: EdgeInsets.symmetric(vertical: 16),
          child: CircleAvatar(
            backgroundImage: imageBytes != null ? MemoryImage(imageBytes!) : null,
            radius: 60,
            child: imageBytes != null
                ? Container()
                : ProfileIcon(
                    size: 48,
                  ),
          ),
        )
      ],
    );
  }
}
