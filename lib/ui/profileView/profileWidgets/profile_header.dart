import 'package:attached/ui/profileView/profileWidgets/profile_image.dart';
import 'package:attached/ui/profileView/profileWidgets/profile_top_menu.dart';
import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileHeader extends ViewModelWidget<ProfileViewModel>{
  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            /*bottom: BorderSide(
           // width: 2
          )*/
          )
      ),
      child: Column(
        children: [
          ProfileTopMenu(),
          Flexible(child: ProfileImage())
        ],
      ),
    );
  }

}