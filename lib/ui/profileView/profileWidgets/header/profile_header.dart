import 'package:attached/services/services.dart';
import 'package:attached/ui/profileView/profileWidgets/header/profile_image.dart';
import 'package:attached/ui/profileView/profileWidgets/header/profile_top_menu.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      collapsedHeight: 120,
      elevation: 4,
      pinned: false,
      floating: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(border: Border()),
        child: Column(
          children: [
            ProfileTopMenu(),
            Flexible(
              child: personaService.personaImage != null ? ProfileImage(
                imageBytes: personaService.personaImage!,
              ) : MemoryImage(kTransparentImage) as Widget,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      stretch: false,
      snap: true,
    );
  }
}
