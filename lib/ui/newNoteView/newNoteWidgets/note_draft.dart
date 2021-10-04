import 'package:flutter/material.dart';

import '../new_note_view_model.dart';
import 'new_note_fabs.dart';
import 'note_entry.dart';

class NoteDraft extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          NoteEntry(),
          Positioned(
              bottom: 16,
              right: 16,
              child: NewNoteFabs())
        ],
      ),
    );
  }
}