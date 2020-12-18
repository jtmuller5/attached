import 'dart:developer';

import 'package:attached/ui/homeView/bodyWidgets/info_icon.dart';
import 'package:attached/ui/homeView/bodyWidgets/love_note_scaler.dart';
import 'package:attached/ui/homeView/bodyWidgets/no_notes.dart';
import 'package:attached/ui/homeView/bodyWidgets/to_from_toggle.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FlexibleHomeBody extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Stack(
      children: [
        PageCenter(),
        ToFromToggle(model),
      ],
    );
  }
}

class PageCenter extends ViewModelWidget<HomeViewModel>{
  @override
  Widget build(BuildContext context, HomeViewModel model) {
      if (model.loadingMessages || !model.modelInitialized) {
        print('loading circle');
        return Center(child: CircularProgressIndicator(),);
      } else {
        print('note content');
        if (model.notes.isNotEmpty) {
          print('notes not empty');
          return PageView.builder(
            controller: model.pageController,
            onPageChanged: (i) {
              model.updateSelectedNote(model.notes[i]);
              model.updateIndex(i);
            },
            itemCount: model.notes.length,
            itemBuilder: (context, index) {
              log(index.toString());
              return LoveNoteScaler(index == model.index);
            },
          );
        }
        else {
          return NoNotes();
        }
      }
    }

}