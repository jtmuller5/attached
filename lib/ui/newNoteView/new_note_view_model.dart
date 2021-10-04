import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:at_commons/at_commons.dart';
import 'package:attached/app/app_router.dart';
import 'package:attached/app/app_router.gr.dart';
import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:base2e15/base2e15.dart';

class NewNoteViewModel extends BaseViewModel {
  LoveNote? loveNote = LoveNote(sender: attachedService.myAtSign ?? '', date: DateTime.now().toString());
  TextEditingController noteController = TextEditingController();
  bool showAttachmentFab = true;

  Map<String?, IconData> attachmentIcons = {
    null: Icons.attach_file,
    'Image': Icons.image,
    'Location': Icons.location_on_rounded,
    'Link': Icons.link,
  };

  void initializeNewNote() {
    noteController.addListener(() {
      updateNoteMessage(noteController.text);
    });
  }

  void setFabVisibility(bool val) {
    showAttachmentFab = val;
    notifyListeners();
  }

  void setNoteType(String val) {
    loveNote?.attachmentType = val;
    notifyListeners();
  }

  Future<void> addImage() async {
    File? image = await mediaService.getImage();

    if(image != null) loveNote?.attachmentContent = Base2e15.encode(image.readAsBytesSync());
  }

  Future<void> addLocation(BuildContext context) async {
    var link = await appRouter.push(AddNoteLinkViewRoute());

    loveNote?.attachmentContent = link;
  }

  Future<void> addLink(BuildContext context) async {
    var link = await appRouter.push(AddNoteLinkViewRoute());

    loveNote?.attachmentContent = link;
  }

  void updateNoteMessage(String newMessage) {
    loveNote?.message = newMessage;
    notifyListeners();
  }

  Future<void> submitNewMessage(BuildContext context) async {
    var rng = Random();
    var noteID = rng.nextInt(999999); // Random note ID

    try {
      // Get an instance of AtClient for the current user
      var atClient = atProtocolService.atClient;

      print('Theirs: ' + attachedService.theirAtSign.toString());
      print('Mine: ' + attachedService.myAtSign.toString());

      // Submit new note only visible to your att@ched person
      var newKey = AtKey();
      newKey.sharedBy = attachedService.myAtSign;
      newKey.sharedWith = attachedService.theirAtSign;
      newKey.key = 'note_${noteID}';

      if(loveNote != null) {
        print('Key:' + newKey.toString());
        print('json data: ' +
            jsonEncode({
              'message': loveNote!.message,
              'attachmentType': loveNote!.attachmentType,
              'attachmentContent': loveNote!.attachmentContent,
            }));

        /// Send the note in json format
        var success = await atClient?.put(
            newKey,
            jsonEncode({
              'message': loveNote!.message,
              'attachmentType': loveNote!.attachmentType,
              'attachmentContent': loveNote!.attachmentContent,
            }));

        await Future.delayed(Duration(seconds: 2));

        print('Success');
        noteService.addNote(loveNote!);
      }
    } catch (e) {
      print('Send Error: ' + e.toString());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Something went wrong'),
      ));
      //Navigator.pop(context);
    }
    notifyListeners();
  }
}
