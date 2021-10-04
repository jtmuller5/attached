import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_onboarding_flutter/services/onboarding_service.dart';
import 'package:attached/models/love_note.dart';
import 'package:attached/services/at/at_stream_service.dart';
import 'package:attached/services/services.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_commons/at_commons.dart';

class HomeViewModel extends ReactiveViewModel {
  bool showToggle = true;
  bool showLogo = true;

  int? index;
  LoveNote? selectedNote;
  bool demo = false;

  List<LoveNote> get notes{
    return noteService.notes;
  }

  PageController pageController = PageController(viewportFraction: 0.7, initialPage: 0);

  void initializeHome() async {
    setBusy(true);
    index = 0;

    String? loggedInAtsign = await atProtocolService.keyChainManager.getAtSign();
    attachedService.setMyAtSign(loggedInAtsign!);

    if (OnboardingService.getInstance().atClientServiceMap[loggedInAtsign] == null) {
      await atProtocolService.getAtClientPreference();
      OnboardingService.getInstance().setAtClientPreference = atProtocolService.atClientPreference!;
      OnboardingService.getInstance().setAtsign = loggedInAtsign;
      await OnboardingService.getInstance().onboard();
    }

    await personaService.onboardPersona(atsign: atProtocolService.atSignList!.firstOrNull);
    await personaService.getPersonaInfo();
    await personaService.getAllKeys();

    await noteService.getMessages().then((value) {
      notifyListeners();
    });

    await AtStreamService().startMonitor();
    /*try {
      // Get an instance of AtClient for the current user
      var atClient = await atProtocolService.atClientImpl;
      // Scans keys shared by the person you're att@ched to
      sharedKeys = await atClient.getKeys(sharedWith: attachedService.theirAtSign.value);

      print('Theirs:' + attachedService.theirAtSign.value);
      print('Shared Keys:' + sharedKeys.toString());

      getKeyValues(sharedKeys, atClient, showSent);
    } catch (e) {
      print(e.toString());
    }*/

    setBusy(false);
  }

  void toggleToggle() {
    showToggle = !showToggle;
    notifyListeners();
  }

  void updateLogo(bool newVal) async {
    showLogo = newVal;
    notifyListeners();
  }

  void updateIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  void updateSelectedNote(LoveNote newNote) {
    print('updating note');
    selectedNote = newNote;
    notifyListeners();
  }

  void getKeyValues(List<String> keys, AtClient atClient, bool sent) {
    keys.forEach((element) async {
      var key = AtKey.fromString(element);
      if (key.key?.contains('note') ?? false) {
        try {
          var value = await atClient.get(key);
          print('Value: ' + value.value.toString());
          var newNote = LoveNote(
            message: value.value.toString(),
            mainColor: Colors.blue,
            sender: sent ? attachedService.myAtSign ?? '' : attachedService.theirAtSign ?? '',
            date: '11/18/20',
            key: '',
          );
          noteService.addNote(newNote);
        } catch (e) {
          print('Error Getting Value: ' + e.toString());
        }
      }
    });
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        noteService,
      ];
}
