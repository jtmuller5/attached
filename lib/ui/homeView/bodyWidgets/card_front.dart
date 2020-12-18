import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CardFront(LoveNote note){
  return Builder(
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
  );
}