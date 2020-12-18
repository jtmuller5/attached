import 'package:attached/ui/homeView/bodyWidgets/home_body.dart';
import 'package:attached/ui/homeView/headerWidgets/flexible_home_header.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FlexibleHome extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: FlexibleHomeHeader(),
        )
      ],
      body: FlexibleHomeBody(),
    );
  }
}