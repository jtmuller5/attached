import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class MemoryRow extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ShadowIcon(
            iconColor: themeService.darkColor,
            icon: Icons.markunread_mailbox_rounded,
            iconSize: 48,
          ),
          ShadowIcon(
            iconColor: themeService.darkColor,
            icon: Icons.map,
            iconSize: 48,
          ),
          ShadowIcon(
            iconColor: themeService.darkColor,
            icon: Icons.image_rounded,
            iconSize: 48,
          ),
        ],
      ),
    );
  }
}
