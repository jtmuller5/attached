import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../new_note_view_model.dart';

class NoteAttachmentFab extends ViewModelWidget<NewNoteViewModel> {

  final String label;
  final String tooltip;
  final Function callback;
  final IconData icon;

  NoteAttachmentFab(this.label, this.tooltip, this.callback, this.icon);

  @override
  Widget build(BuildContext context, NewNoteViewModel model) {
    return Padding(padding: EdgeInsets.all(8),
      child: FloatingActionButton.extended(
        label: Text(label),
        tooltip: tooltip,
        icon:  Icon(icon,color: Colors.white,),
        heroTag: 'note ${label.toLowerCase()}',
        backgroundColor: model.loveNote?.attachmentType == label ? Colors.blueGrey.shade700 : Colors.blueGrey.shade400,
        onPressed: (){
          model.setNoteType(label);
          callback();
        },
      ),);
  }

}