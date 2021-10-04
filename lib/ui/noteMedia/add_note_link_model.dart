import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddNoteLinkViewModel extends BaseViewModel{

  String? link;

  TextEditingController linkController = TextEditingController();

  void initialize(){
    linkController.addListener(() {
      link = linkController.text;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

}