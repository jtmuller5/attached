import 'package:attached/ui/profileView/profileWidgets/flexible_profile_body.dart';
import 'package:attached/ui/profileView/profileWidgets/flexible_profile_header.dart';
import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FlexibleProfile extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
      <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: FlexibleProfileHeader(),
        )
      ],
      body: FlexibleProfileBody(),
    );
  }
}