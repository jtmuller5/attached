import 'dart:convert';

import 'package:at_onboarding_flutter/services/onboarding_service.dart';
import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:at_commons/at_commons.dart';
import 'package:stacked/stacked.dart';

@singleton
class NoteService with ReactiveServiceMixin {

  List<LoveNote> notes = [];
  List<LoveNote> receivedNotes = [];
  bool showSent = true;
  bool querying = false;

  Future<void> deleteNote(LoveNote note) async {
    bool deleted = await atProtocolService.atClient?.delete(AtKey.fromString(note.key!)) ?? false;
    notes.removeWhere((element) => element.key == note.key);
    print('deleted: ' + deleted.toString());
  }

  void toggleSent() {
    print('toggle');
    showSent = !showSent;

    //getMessages(showSent.value);
  }

  /// Run this once
  Future<void> getMessages() async {
    querying = true;

    notes = [];

    // Get an instance of AtClient for the current user
    // var atClient = await AtClientImpl.getClient(attachedService.myAtSign);
    // var atClient = atProtocolService.atClientImpl;

    List<String> sharedKeys = [];

    // All keys for attachment
    sharedKeys = await OnboardingService.getInstance().atClientServiceMap[attachedService.myAtSign]?.atClientManager.atClient?.getKeys(
              // sharedBy: attachedService.theirAtSign,
              sharedWith: attachedService.theirAtSign,
            ) ??
        [];

    print('keys in attachment : ' + sharedKeys.toString());
    /*} else {
      sharedKeys = await atProtocolService.atClientImpl.getKeys(sharedWith: attachedService.theirAtSign.value);

      print('keys shared with them : ' + sharedKeys.toString());
    }*/

    print('scanning keys');

    await Future.forEach(sharedKeys, (String element) async {
      String keyString = element;

      await processNoteKey(keyString);
    });

    querying = false;
  }

  Future<void> processNoteKey(String keyString) async {
    if (keyString.contains('note')) {
      var key = AtKey.fromString(keyString);

      print('Note Key: ' + key.toString());

      var value = await atProtocolService.atClient?.get(key);

      if (value != null && value.value.toString().contains('message')) {
        print('mapped message: ' + value.value.toString());
        Map<dynamic, dynamic> jsonResponse = jsonDecode(value.value);

        var newNote = LoveNote(
            message: jsonResponse['message'].toString(),
            mainColor: Colors.blue,
            sender:
                '@' + key.sharedWith.toString() == attachedService.theirAtSign ? attachedService.myAtSign ?? '' : attachedService.theirAtSign ?? '',
            date: '11/18/20',
            attachmentContent: jsonResponse['attachmentContent'],
            attachmentType: jsonResponse['attachmentType'],
            key: key.toString());

        addNote(newNote);
      }
    }
  }

  void addNote(
    LoveNote note,
  ) {
    if (note.message != null && note.message != '' && note.message != 'null') {
      notes.add(note);
      notifyListeners();
    }
  }


  void addReceivedNote(
    LoveNote note,
  ) {
    if (note.message != null && note.message != '' && note.message != 'null') {
      receivedNotes.add(note);
      notifyListeners();
    }
  }
}
