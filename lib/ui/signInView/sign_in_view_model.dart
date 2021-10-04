import 'package:at_onboarding_flutter/services/onboarding_service.dart';
import 'package:attached/app/app_router.dart';
import 'package:attached/app/app_router.gr.dart';
import 'package:attached/services/at/at_protocol_service.dart';
import 'package:attached/services/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInViewModel extends BaseViewModel {
  String root = 'test.do-sf2.atsign.zone';
  int rootPort = 64;
  String namespace = 'server_demo';
  bool debug = true;
  bool verbose = true;
  bool showSpinner = false;

  String? get atSign {
    return attachedService.myAtSign;
  }

  String? message;
  FilePickerResult? keyFile;

  TextEditingController atSignController = TextEditingController();

  /// Route user based on onboarding process
  Future<void> initialize() async {
    setBusy(true);
    //await atProtocolService.setup();
    Map<String, bool?> atSignStatuses = await atProtocolService.keyChainManager.getAtsignsWithStatus();

    print('Statuses: ' + atSignStatuses.toString());
    await atProtocolService.getAtClientPreference();

    List<String>? atSigns = await atProtocolService.keyChainManager.getAtSignListFromKeychain();
    print('AtSign list: ' + atSigns.toString());

    if (atSigns != null && (atSigns).isNotEmpty) {
      OnboardingService.getInstance().setAtClientPreference = atProtocolService.atClientPreference!;
      OnboardingService.getInstance().setAtsign = atSigns.first;
      bool success = await OnboardingService.getInstance().onboard();

      if (success) {
        print('Logged in');
        await appRouter.replace(HomeViewRoute());
        /*WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
          print('Pushing');
          await appRouter.push(HomeViewRoute());
        });*/
      }

      setBusy(false);
    }
  }

  void toggleSpinner() {
    showSpinner = !showSpinner;
    notifyListeners();
  }

  void updateAtSign(String newAt) {
    attachedService.myAtSign = newAt;
    notifyListeners();
  }

  void launchToAtStore() async {
    const url = 'https://atsign.com/get-an-sign/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
