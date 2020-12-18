import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/info_icon.dart';
import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileTopMenu extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return Card(
      color: themeService.darkColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              child: ShadowIcon(icon: Icons.arrow_back_rounded,iconColor: Colors.white,),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Basic information and announcements
                InfoIcon(context),
                // Link to app settings
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShadowIcon(
                      icon: Icons.settings,
                      shadowColor: Colors.black,
                      iconColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}