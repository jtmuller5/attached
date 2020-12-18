import 'package:attached/models/love_note.dart';
import 'package:attached/ui/homeView/bodyWidgets/love_note_card.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class LoveNoteDisplay extends ViewModelWidget<HomeViewModel>{
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    if(!model.loadingMessages) {
      return Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(model.selectedNote.date ?? '12/15/2020',
                      style: GoogleFonts.caveat(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      )),
                  Text('Swipe left and right for more',
                    style: TextStyle(
                        fontWeight: FontWeight.w300
                    ),),
                ],
              ),
            ),
            Flexible(flex: 5, child: LoveNoteCard(model.selectedNote, model)),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }


}