import 'package:attached/ui/homeView/headerWidgets/home_header.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FlexibleHomeHeader extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      elevation: 0,
      pinned: false,
      floating: true,
      flexibleSpace: HomeHeader(),
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