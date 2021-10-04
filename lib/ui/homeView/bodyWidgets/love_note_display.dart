import 'package:attached/models/love_note.dart';
import 'package:attached/ui/homeView/bodyWidgets/love_note_card.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class LoveNoteDisplay extends ViewModelWidget<HomeViewModel>{

  final LoveNote pageCard;

  LoveNoteDisplay(this.pageCard); // Need so the same card isn't shown everywhere

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    if(!model.isBusy) {
      return Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(flex: 1,),
          Flexible(flex: 7, child: LoveNoteCard(pageCard,)),
          Spacer(
            flex: 4,
          )
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }


}