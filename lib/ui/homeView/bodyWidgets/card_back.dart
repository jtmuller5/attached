import 'package:attached/models/love_note.dart';
import 'package:flutter/material.dart';

Widget CardBack(LoveNote note, String sender){
  return Builder(
    builder: (context) => Container(
      width: MediaQuery.of(context).size.width / 3 * 2,
      child: Card(
        shape: BeveledRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColorDark),
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
                      sender,
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
  );
}