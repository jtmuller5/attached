import 'package:attached/ui/homeView/headerWidgets/memory_row.dart';
import 'package:attached/ui/homeView/headerWidgets/header_top_menu.dart';
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
          /*bottom: BorderSide(
           // width: 2
          )*/
        )
      ),
      child: Column(
        children: [
          HeaderTopMenu(),
          Flexible(child: MemoryRow())
        ],
      ),
    );
  }

}