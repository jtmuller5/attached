import 'package:attached/ui/profileView/profileWidgets/profile_header.dart';
import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FlexibleProfileHeader extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 150,
      collapsedHeight: 120,
      elevation: 4,
      pinned: false,
      floating: true,
      flexibleSpace: ProfileHeader(),
      backgroundColor: Colors.white,
      stretch: false,
      snap: true,
    );
  }

  Widget ProfileIcon(String image) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Image.asset(image,
        color: Colors.blue,
        height: 36,),
    );
  }
}