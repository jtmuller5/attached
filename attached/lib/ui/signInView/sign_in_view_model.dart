import 'package:attached/services/at_protocol_service.dart';
import 'package:attached/ui/attachView/attach_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

class SignInViewModel extends BaseViewModel{
  String root = 'test.do-sf2.atsign.zone';
  int rootPort = 64;
  String namespace = 'server_demo';
  bool debug = true;
  bool verbose = true;
  bool showSpinner = false;
  String atSign;
  String message;

  TextEditingController atSignController = TextEditingController();
  AtProtocolServer atProtocolServer = AtProtocolServer();

  void toggleSpinner(){
    showSpinner = !showSpinner;
    notifyListeners();
  }

  void updateAtSign(String newAt){
    atSign = newAt;
    notifyListeners();
  }

  // TODO: Write _login method
  /// Use onboard() if device has PKAM public/private keys
  /// in keychain. If that is unsuccessful, use authenticate()
  /// to perform a CRAM auth instead.
  login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (atSign != null) {
      atProtocolServer.onboard().then((value) {
        Navigator.pushReplacementNamed(context, AttachView.id);
      }).catchError((error) async {
        try {
          await atProtocolServer.authenticate(atSign,
              cramSecret: at_demo_data.cramKeyMap[atSign]);
          Navigator.pushNamed(context, AttachView.id);
        } catch(e){
          toggleSpinner();
          message = "There was an issue authenticating this @ sign";
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(message,
                textAlign: TextAlign.center),
          ));
        }
      });
    } else{
     toggleSpinner();
      message = "Enter an @ sign to sign in";
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message,
        textAlign: TextAlign.center,),
      ));
    }
    notifyListeners();
  }
}