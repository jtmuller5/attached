import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'note_details_view_model.dart';

class NoteDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NoteDetailsViewModel>.reactive(
      viewModelBuilder: () => NoteDetailsViewModel(),
      onModelReady: (model) {
        // model.initialize();
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