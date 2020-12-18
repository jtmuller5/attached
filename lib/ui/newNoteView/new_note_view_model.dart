import 'dart:math';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_commons/at_commons.dart';

class NewNoteViewModel extends BaseViewModel {
  LoveNote loveNote = LoveNote(images: [],gifts: [],location: '');
  TextEditingController noteController = TextEditingController();
  HomeViewModel homeModel;

  void initializeNewNote(HomeViewModel model){
    homeModel = model;
    noteController.addListener(() {
      updateNoteMessage(noteController.text);
    });
  }

  void updateNoteMessage(String newMessage) {
    loveNote.message = newMessage;
    notifyListeners();
  }
}
