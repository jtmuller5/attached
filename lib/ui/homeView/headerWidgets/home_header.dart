import 'package:attached/ui/homeView/headerWidgets/top_menu.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class HomeHeader extends ViewModelWidget<HomeViewModel>{
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2
          )
        )
      ),
      child: Column(
        children: [
          TopMenu()
        ],
      ),
    );
  }

}