import 'package:attached/ui/signInView/sign_in_view_model.dart';
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
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: model.atSignController,
                      style: TextStyle(color: Colors.white),
                      onChanged: (newAt){
                        model.updateAtSign(newAt);
                      },
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: Icon(Icons.alternate_email,color: Colors.white,),
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
                  RaisedButton(
                      child: Text('Start'),
                      onPressed: () {
                        model.toggleSpinner();
                        model.login(context);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
