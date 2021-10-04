import 'package:attached/services/services.dart';
import 'package:attached/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class AttachViewModel extends BaseViewModel {
  String? attachedString;

  TextEditingController attacheeController = TextEditingController();

  void updateAttachedString(String attached) {
    attachedString = attached;
    notifyListeners();
  }

  void updateAttached(String attached) {
    updateAttachedString(attached);

    if (attachedString != null) {
      if (attachedString!.contains('@')) {
        attachedService.theirAtSign = attachedString;
      } else {
        attachedService.theirAtSign = '@' + attachedString!;
      }
      print('is user box open? ' + Hive.isBoxOpen('at_user').toString());

      userService.userBox.put(UserService.theirAtSignKey, attachedService.theirAtSign);

      noteService.getMessages();
    }

    notifyListeners();
  }
}
