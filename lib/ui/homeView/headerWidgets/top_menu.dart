import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/info_icon.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class TopMenu extends ViewModelWidget<HomeViewModel> {
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
              child: ShadowIcon(
                icon: Icons.person,
                shadowColor: Colors.black,
                iconColor: Colors.white,
              ),
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
          )
        ],
      ),
    );
  }
}
