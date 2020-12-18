import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/info_icon.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/profileView/profile_view.dart';
import 'package:attached/ui/reusables/icons/profile_icon.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class HeaderTopMenu extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Card(
      color: themeService.darkColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Open personal profile
          // Should ask to link to @Persona
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileIcon()
            ),
            onTap: (){
              Navigator.of(context).pushNamed(ProfileView.id);
            },
          ),
        ],
      ),
    );
  }
}
