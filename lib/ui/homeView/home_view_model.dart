import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:attached/main.dart';
import 'package:attached/services/attached_service.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_commons/at_commons.dart';

class HomeViewModel extends BaseViewModel {
  List<LoveNote> notes = [];
  List<String> sharedKeys = [];

  String sender = "You";
  String receiver = "Them";

  String senderAt;
  String receiverAt;

  LoveNote note =
      LoveNote("This is amazing", Colors.redAccent, "@bob🛠", "11/18/2020");

  void initializeHome() async {
    senderAt = getIt.get<AttachedService>().myAtSign;
    receiverAt = getIt.get<AttachedService>().theirAtSign;

    try {
      // Get an instance of AtClient for the current user
      var atClient =
      await AtClientImpl.getClient(getIt
          .get<AttachedService>()
          .myAtSign);
      // Scans keys shared by the person you're att@ched to
      sharedKeys = await atClient.getKeys(
          sharedWith: getIt
              .get<AttachedService>()
              .theirAtSign);

      print("Theirs:" + getIt
          .get<AttachedService>()
          .theirAtSign);
      print("Shared Keys:" + sharedKeys.toString());

      getKeyValues(sharedKeys, atClient);
    } catch (e){
      print(e.toString())
;    }

    notifyListeners();
  }

  void getKeyValues(List<String> keys, AtClient atClient){

    keys.forEach((element) async {
      AtKey key = AtKey.fromString(element);
      print(key);
      try {
        AtValue value = await atClient.get(key);
        print("Value: " + value.value.toString());
        LoveNote newNote = LoveNote(value.value.toString(), Colors.blue, sender, "11/18/20");
        notes.add(newNote);
      } catch(e){
        print("Error Getting Value: " + e.toString());
      }
    });
    notifyListeners();
  }

  Future<void> toggleSender() async {
    notes = []; // Reset love notes
    if(sender == "You"){
      sender = "Them";
      receiver = "You";

      receiverAt = getIt.get<AttachedService>().myAtSign;
      senderAt = getIt.get<AttachedService>().theirAtSign;

      try {
        var atClient =
        await AtClientImpl.getClient(getIt
            .get<AttachedService>()
            .myAtSign);
        // Scans keys shared by the person you're att@ched to
        sharedKeys = await atClient.getKeys(
            sharedBy: getIt
                .get<AttachedService>()
                .theirAtSign);

        getKeyValues(sharedKeys, atClient);
      } catch (e){
        print(e.toString());
      }

    } else {
      sender = "You";
      receiver = "Them";

      senderAt = getIt.get<AttachedService>().myAtSign;
      receiverAt = getIt.get<AttachedService>().theirAtSign;

      try {
        var atClient =
        await AtClientImpl.getClient(getIt
            .get<AttachedService>()
            .myAtSign);
        // Scans keys shared by the person you're att@ched to
        sharedKeys = await atClient.getKeys(
            sharedWith: getIt
                .get<AttachedService>()
                .theirAtSign);

        getKeyValues(sharedKeys, atClient);

        print("Shared Keys:" + sharedKeys.toString());
      } catch (e){
        print(e.toString());
      }
    }
    notifyListeners();
  }
}
