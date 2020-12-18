
import 'package:flutter/material.dart';

Widget NoNotes() {
  return Center(
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Spacer(
          flex: 2,
        ),
        Flexible(
          flex: 2,
          child: Card(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: Text('There\'s nothing here :('),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    ),
  );
}