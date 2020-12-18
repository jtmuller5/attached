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

  Future<void> submitNewMessage(BuildContext context) async {
    var rng = Random();
    var noteID = rng.nextInt(999999); // Random note ID

    try {
      // Get an instance of AtClient for the current user
      var atClient =
      await AtClientImpl.getClient( attachedService
          .myAtSign);

      print('Yours: ' +  attachedService
          .theirAtSign);

      // Submit new note only visible to your att@ched person
      var newKey = AtKey();
      newKey.sharedWith =  attachedService
          .theirAtSign;
      newKey.key = 'note_${noteID}';

      print('Key:' + newKey.toString());

      var success = await atClient.put(newKey, loveNote.message);

      if (success) {
        print('Success');
        homeModel.addMessage(loveNote);
        Navigator.pop(context);
      } else {
        print('Failure');
        Navigator.pop(context);
      }
    } catch(e){
      print('Send Error: ' +e.toString());
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Something went wrong'),));
      //Navigator.pop(context);
    }
  }
}
