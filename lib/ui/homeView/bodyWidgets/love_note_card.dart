import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget LoveNoteCard(LoveNote note, HomeViewModel model) {
    return FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Builder(
          builder: (context) => Container(
            width: MediaQuery.of(context).size.width / 3 * 2,
            child: Card(
              shape: BeveledRectangleBorder(
                  side: BorderSide(color: themeService.darkColor),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Card(
                shape: BeveledRectangleBorder(
                    side: BorderSide(color: Colors.black,
                        width: .5),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text(note.message,
                            style: GoogleFonts.caveat(
                                textStyle: TextStyle(fontSize: 16))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        back: Builder(
          builder: (context) => Container(
            width: MediaQuery.of(context).size.width / 3 * 2,
            child: Card(
              shape: BeveledRectangleBorder(
                  side: BorderSide(color: themeService.darkColor),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Card(
                shape: BeveledRectangleBorder(
                    side: BorderSide(color: Colors.black,
                        width: .5),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            model.senderAt,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            note.date ??= '12/15/2020',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
}