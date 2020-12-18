import 'package:attached/services/services.dart';
import 'package:attached/ui/attachView/attach_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import 'package:url_launcher/url_launcher.dart';

class SignInViewModel extends BaseViewModel {
  String root = 'test.do-sf2.atsign.zone';
  int rootPort = 64;
  String namespace = 'server_demo';
  bool debug = true;
  bool verbose = true;
  bool showSpinner = false;
  String get atSign{
    return attachedService.myAtSign;
  }
  String message;
  FilePickerResult keyFile;

  TextEditingController atSignController = TextEditingController();

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

  // TODO: Write _login method
  /// Use onboard() if device has PKAM public/private keys
  /// in keychain. If that is unsuccessful, use authenticate()
  /// to perform a CRAM auth instead.
  login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    print('Before login');
    if (atSign != null) {
      await atProtocolService.onboard().then((value) {
        if (atSign.contains('@')) {
          attachedService.myAtSign = atSign;
          attachedService.mySign = atSign.replaceAll('@', '');
        } else {
          attachedService.myAtSign = '@' + atSign;
          attachedService.mySign = atSign;
        }
        print('My at sign: ' + attachedService.myAtSign);
        Navigator.pushReplacementNamed(context, AttachView.id);
      }).catchError((error) async {
        try {
          print('My at sign: ' + attachedService.myAtSign);
          await atProtocolService.authenticate(
            attachedService.myAtSign,
            cramSecret: at_demo_data.cramKeyMap[atSign],
          );
          Navigator.pushNamed(context, AttachView.id);
        } catch (e) {
          print('Error: ' + e.toString());
          toggleSpinner();
          message = 'There was an issue authenticating this @ sign';
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(message, textAlign: TextAlign.center),
          ));
        }
      });
    } else {
      toggleSpinner();
      message = 'Enter an @ sign to sign in';
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ));
    }
    notifyListeners();
  }
}
