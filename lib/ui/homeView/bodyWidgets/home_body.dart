import 'dart:developer';

import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/info_icon.dart';
import 'package:attached/ui/homeView/bodyWidgets/love_note_scaler.dart';
import 'package:attached/ui/homeView/bodyWidgets/no_notes.dart';
import 'package:attached/ui/homeView/bodyWidgets/to_from_toggle.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FlexibleHomeBody extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Stack(
      children: [
        /*if(model.notes.isNotEmpty)
          Positioned(
            left: 0,
              right: 0,
              top: 16,
            child: AttachedLogo())*/
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            if(model.notes.isNotEmpty)Flexible(
                flex: 1,
                child: AttachedLogo()),
            Flexible(
                flex: 3,
                child: PageCenter()),
            Spacer(
              flex: 1,
            )
          ],
        ),
        ToFromToggle(model),
      ],
    );
  }
}

class PageCenter extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    if (model.loadingMessages || !model.modelInitialized) {
      print('loading circle');
      return Center(
        child: CircularProgressIndicator(
          //backgroundColor: themeService.darkColor,
          valueColor: AlwaysStoppedAnimation<Color>(themeService.darkColor),
        ),
      );
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
            return LoveNoteScaler(index == model.index,model.notes[index]);
          },
        );
      } else {
        return NoNotes();
      }
    }
  }
}
