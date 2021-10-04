import 'package:attached/models/love_note.dart';
import 'package:attached/ui/homeView/bodyWidgets/love_note_card.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoveNoteScaler extends ViewModelWidget<HomeViewModel>{
  final bool inCenter;
  final LoveNote pageCard;

  LoveNoteScaler(this.inCenter, this.pageCard);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Transform.scale(
      scale: inCenter?1:0.9,
      child: LoveNoteCard(pageCard,),);
  }

}