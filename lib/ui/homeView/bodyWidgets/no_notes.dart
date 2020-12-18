
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:flutter/material.dart';

Widget NoNotes() {
  return Center(
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 3,
          child: Card(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                        height: 200,
                        child: AttachedLogo()),
                  ),
                  Text('There\'s nothing here...'),
                ],
              ),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    ),
  );
}