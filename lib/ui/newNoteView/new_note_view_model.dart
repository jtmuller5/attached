import 'dart:math';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:attached/main.dart';
import 'package:attached/services/attached_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_commons/at_commons.dart';

class NewNoteViewModel extends BaseViewModel {
  String noteMessage;
  TextEditingController noteController = TextEditingController();

  void updateNoteMessage(String newMessage) {
    noteMessage = newMessage;
    notifyListeners();
  }

  Future<void> submitNewMessage(BuildContext context) async {
    var rng = Random();
    var noteID = rng.nextInt(999999); // Random note ID

    try {
      // Get an instance of AtClient for the current user
      var atClient =
      await AtClientImpl.getClient(getIt
          .get<AttachedService>()
          .myAtSign);

      print("Yours: " + getIt
          .get<AttachedService>()
          .theirAtSign);

      // Submit new note only visible to your att@ched person
      var newKey = AtKey();
      newKey.sharedWith = getIt
          .get<AttachedService>()
          .theirAtSign;
      newKey.key = 'note_${noteID}';

      print('Key:' + newKey.toString());

      bool success = await atClient.put(newKey, noteMessage);

      if (success) {
        print("Success");
        Navigator.pop(context);
      } else {
        print("Failure");
        Navigator.pop(context);
      }
    } catch(e){
      print("Send Error: " +e.toString());
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Something went wrong"),));
      //Navigator.pop(context);
    }
  }
}
