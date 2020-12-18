import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AttachViewModel extends BaseViewModel{
String attachedString;

  TextEditingController attacheeController = TextEditingController();

  void updateAttachedString(String attached){
    attachedString = attached;
    notifyListeners();
  }

  void updateAttached(){
    if(attachedString.contains('@')) {
      attachedService
          .theirAtSign = attachedString;
     attachedService
          .theirSign = attachedString.replaceAll('@', '');
    } else{
      attachedService
          .theirAtSign = '@'+attachedString;
      attachedService
          .theirSign = attachedString;
    }
    notifyListeners();
  }
}