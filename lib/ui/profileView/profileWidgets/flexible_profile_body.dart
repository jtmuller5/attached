import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:attached/ui/reusables/text_quality.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class FlexibleProfileBody extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextQuality(hint: 'Wish list'),
            TextQuality(hint: 'Favorite color'),
            TextQuality(hint: 'Favorite food'),
            TextQuality(hint: 'Love languages'),
            TextQuality(hint: 'Life Goals'),
          ],
        ),
      ],
    );
  }
}
