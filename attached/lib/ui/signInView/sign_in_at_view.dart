import 'package:attached/ui/signInView/sign_in_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class SignInAtView extends StatelessWidget {
  static const String id = "sign_in_at_view";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: ModalProgressHUD(
            inAsyncCall: model.showSpinner,
            child: Builder(
              builder: (context) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlreadySignedIn(model, context),
                    Flexible(
                      child: Container(
                          width: 100,
                          child: Divider(
                            thickness: 2,
                          )),
                    ),
                    ExistingKeys(model),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ExistingKeys(SignInViewModel model) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Use Existing Keys',
            style: TextStyle(fontSize: 36),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Please select the zip file containing your keys and QR code',
                overflow: TextOverflow.ellipsis,)),
          ),
          OutlineButton(
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.file_upload),
                    Text('Coming Soon'),
                    //Text('Locate Keys'),
                  ],
                ),
              ),
              onPressed: true?null:() async {
                model.keyFile = await FilePicker.platform.pickFiles();
              }),
        ],
      ),
    );
  }

  Widget AlreadySignedIn(SignInViewModel model, BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              child: TextField(
                controller: model.atSignController,
                style: TextStyle(color: Colors.white),
                onChanged: (newAt) {
                  model.updateAtSign(newAt);
                },
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.alternate_email,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    filled: true,
                    fillColor: Colors.red.shade300,
                    focusColor: Colors.red,
                    hintText: "Your @ sign...",
                    hintStyle: TextStyle(color: Colors.white38)),
              ),
            ),
          ),
          OutlineButton(
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.arrow_forward_rounded),
                    Text('Start'),
                  ],
                ),
              ),
              onPressed: () {
                model.toggleSpinner();
                model.login(context);
              })
        ],
      ),
    );
  }
}
