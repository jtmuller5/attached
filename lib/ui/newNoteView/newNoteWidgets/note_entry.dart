import 'package:attached/app/themes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../new_note_view_model.dart';

class NoteEntry extends ViewModelWidget<NewNoteViewModel> {
  @override
  Widget build(BuildContext context, NewNoteViewModel model) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(8),
          side: BorderSide(
              color: Theme.of(context).primaryColorDark,
              width: 2
          )
      ),
      child: Container(
        height: 200,
        child: TextField(
          minLines: 8,
          maxLines: 8,
          controller: model.noteController,
          style: TextStyle(color: Colors.black),
          decoration: attachedInput.copyWith(contentPadding: EdgeInsets.all(8),
            border: InputBorder.none,
            focusColor: Colors.black,
            fillColor: Colors.grey.shade50,
            labelStyle: TextStyle(
              color: Colors.black
            ),
            labelText: 'Tap to type a message',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: 'Type your message'
          ),
        ),
      ),
    );
  }
}