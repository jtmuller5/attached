
import 'package:attached/models/love_note.dart';
import 'package:flutter/material.dart';

Widget Background(LoveNote note) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [note.mainColor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [-.9, .8])),
  );
}