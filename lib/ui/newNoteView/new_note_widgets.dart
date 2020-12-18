import 'package:attached/services/services.dart';
import 'package:attached/ui/newNoteView/new_note_view_model.dart';
import 'package:attached/ui/reusables/quality_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class NoteDraft extends StatelessWidget {
  final NewNoteViewModel model;

  const NoteDraft({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          NoteEntry(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QualityIcon(
                  icon: Icons.image,
                  iconColor: themeService.darkColor,
                  added: model.loveNote.images.isNotEmpty,
                ),
                QualityIcon(
                    icon: Icons.pin_drop,
                    iconColor: themeService.darkColor,
                    added: model.loveNote.location.isNotEmpty),
                QualityIcon(
                    icon: Icons.card_giftcard,
                    iconColor: themeService.darkColor,
                    added: model.loveNote.gifts.isNotEmpty)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NoteEntry extends ViewModelWidget<NewNoteViewModel> {
  @override
  Widget build(BuildContext context, NewNoteViewModel model) {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          minLines: 8,
          maxLines: 8,
          maxLength: 200,
          controller: model.noteController,
          style: TextStyle(color: Colors.black),
          decoration: themeService.appInput.copyWith(
            //prefixIcon: Icon(Icons.email_outlined,color: Colors.red,),
            hintText: 'Send the love',
          ),
        ),
      ),
    );
  }
}

class DraggableNote extends ViewModelBuilderWidget<NewNoteViewModel> {
  @override
  Widget builder(BuildContext context, NewNoteViewModel model, Widget child) {
    return Draggable(
      child: NoteEntry(),
      feedback: NoteEntry(),
      childWhenDragging: Container(),
    );
  }

  @override
  NewNoteViewModel viewModelBuilder(BuildContext context) => NewNoteViewModel();
}
