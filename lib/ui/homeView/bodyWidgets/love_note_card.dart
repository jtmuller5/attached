import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/card_back.dart';
import 'package:attached/ui/homeView/bodyWidgets/card_front.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget LoveNoteCard(LoveNote note, HomeViewModel model) {
    return CardFront(note)
    /*  FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: CardFront(note),
        back: CardBack(note, model.sender))*/;
}