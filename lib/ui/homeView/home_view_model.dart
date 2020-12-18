import 'dart:math';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_commons/at_commons.dart';

class HomeViewModel extends BaseViewModel {
  List<LoveNote> notes = [];
  List<String> sharedKeys = [];

  String sender = 'You';
  String receiver = 'Them';

  String senderAt;
  String receiverAt;

  bool showToggle = true;
  bool loadingMessages = false;
  bool modelInitialized = false;
  bool showLogo = true;

  ScrollController scrollController = ScrollController();

  ScrollController get livingScrollController {
    if(scrollController == null) {
      print('resetting controller');
      scrollController = ScrollController();
      scrollController.addListener(() {
        if(scrollController.offset<120){
          updateLogo(false);
        } else {
          updateLogo(true);
        }
      });
      return scrollController;
    }
    else {
      return scrollController;
    }
  }

  void removeScroll(){
    scrollController = null;
    notifyListeners();
  }

  int index;
  LoveNote selectedNote;

  PageController pageController =
      PageController(viewportFraction: 0.7, initialPage: 0);

  LoveNote note = LoveNote(
    message: 'This is amazing',
    mainColor: Colors.redAccent,
    sender: '@bob🛠',
    date: '11/18/2020',
  );

  void initializeHome() async {
    senderAt = attachedService.myAtSign;
    receiverAt = attachedService.theirAtSign;
    index = 0;

    await getMessages(attachedService.myAtSign);

    await initializeServices();
    /*print('adding at sign to box - auth');
      print('user box: '+ userService.userBoxId);

      print('user box open: '+ Hive.isBoxOpen(userService.userBoxId).toString());
      await userService.userBox.put(UserService.atSignKey, attachedService.myAtSign);*/

    scrollController.addListener(() {
      if(scrollController.offset<120){
        updateLogo(false);
      } else {
        updateLogo(true);
      }
    });

    try {
      // Get an instance of AtClient for the current user
      var atClient = await AtClientImpl.getClient(attachedService.myAtSign);
      // Scans keys shared by the person you're att@ched to
      sharedKeys =
          await atClient.getKeys(sharedWith: attachedService.theirAtSign);

      print('Theirs:' + attachedService.theirAtSign);
      print('Shared Keys:' + sharedKeys.toString());

      getKeyValues(sharedKeys, atClient);
    } catch (e) {
      print(e.toString());
    }

    modelInitialized = true;
  }

  Future<void> getMessages(String sender) async {
    notes = [];

    // Get an instance of AtClient for the current user
    var atClient = await AtClientImpl.getClient(attachedService.myAtSign);

    sharedKeys = [];
    if (sender == attachedService.theirAtSign) {
      // Scans keys shared by the person you're att@ched to
      sharedKeys = await atClient.getKeys(
          sharedBy: attachedService.theirAtSign,
          sharedWith: attachedService.myAtSign);
    } else {
      sharedKeys = await atClient.getKeys(
          sharedBy: attachedService.myAtSign,
          sharedWith: attachedService.theirAtSign);
    }

    print('scanning keys');
    await sharedKeys.forEach((element) async {
      var keyString = element;
      if (keyString.contains('note')) {
        var key = AtKey.fromString(element);
        print(key);
        try {
          var value = await atClient.get(key);
          print('Value: ' + value.value.toString());
          var newNote = LoveNote(
            message: value.value.toString(),
            mainColor: Colors.blue,
            sender: sender,
            date: '11/18/20',
          );
          addMessage(newNote);
          updateSelectedNote(newNote);
        } catch (e) {
          print('Error Getting Value: ' + e.toString());
        }
      }
    });

    notifyListeners();
  }

  void addMessage(LoveNote note) {
    notes.add(note);
    //notifyListeners();
  }

  Future<void> submitNewMessage(BuildContext context, LoveNote loveNote) async {
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
        addMessage(loveNote);
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

  void toggleToggle() {
    showToggle = !showToggle;
    notifyListeners();
  }

  void updateLogo(bool newVal) async{
    showLogo = newVal;
    notifyListeners();
  }

  void updateIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  void setLoading(bool newVal) {
    print('loading: ' + newVal.toString());
    loadingMessages = newVal;
    notifyListeners();
  }

  void updateSelectedNote(LoveNote newNote) {
    print('updating note');
    selectedNote = newNote;
    notifyListeners();
  }

  void getKeyValues(List<String> keys, AtClient atClient) {
    keys.forEach((element) async {
      var key = AtKey.fromString(element);
      print(key);
      if (key.key.contains('note')) {
        try {
          var value = await atClient.get(key);
          print('Value: ' + value.value.toString());
          var newNote = LoveNote(
            message: value.value.toString(),
            mainColor: Colors.blue,
            sender: sender,
            date: '11/18/20',
          );
          notes.add(newNote);
        } catch (e) {
          print('Error Getting Value: ' + e.toString());
        }
      }
    });
    notifyListeners();
  }

  Future<void> toggleSender() async {
    toggleToggle();
    setLoading(true);
    if (sender == 'You') {
      sender = 'Them';
      receiver = 'You';

      receiverAt = attachedService.myAtSign;
      senderAt = attachedService.theirAtSign;

      try {
        await getMessages(attachedService.theirAtSign)
            .then((value) => setLoading(false));
      } catch (e) {
        print(e.toString());
      }
    } else {
      sender = 'You';
      receiver = 'Them';

      senderAt = attachedService.myAtSign;
      receiverAt = attachedService.theirAtSign;

      try {
        await getMessages(attachedService.myAtSign)
            .then((value) => setLoading(false));
        print('Shared Keys:' + sharedKeys.toString());
      } catch (e) {
        print(e.toString());
      }
    }
    toggleToggle();
    notifyListeners();
  }
}
