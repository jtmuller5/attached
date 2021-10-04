import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'body/profile_body.dart';
import 'header/profile_header.dart';

class FlexibleProfile extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: ProfileHeader()
        )
      ],
      body: ProfileBody(),
    );
  }
}
