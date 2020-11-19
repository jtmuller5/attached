import 'package:attached/main.dart';
import 'package:attached/services/attached_service.dart';
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
    getIt.get<AttachedService>().yourAtSign = attachedString;
    notifyListeners();
  }
}