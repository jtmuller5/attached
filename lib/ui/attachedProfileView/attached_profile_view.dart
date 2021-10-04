import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'attached_profile_view_model.dart';

class AttachedProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttachedProfileViewModel>.reactive(
      viewModelBuilder: () => AttachedProfileViewModel(),
      onModelReady: (model) {
        model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
            body: Column(
              children: [
                Container()
              ],
            )
        );
      },
    );
  }
}