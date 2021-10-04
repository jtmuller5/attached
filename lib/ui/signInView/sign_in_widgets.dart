import 'package:attached/app/themes.dart';
import 'package:attached/ui/signInView/sign_in_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AlreadySignedIn extends ViewModelWidget<SignInViewModel>{

  final BuildContext context;

  AlreadySignedIn( this.context);

  @override
  Widget build(BuildContext context, model) {
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
                decoration: attachedInput.copyWith(
                  hintText: 'Your @ sign...',
                  prefixIcon: Icon(Icons.alternate_email, color: Colors.white,),
                ),
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
                //model.login(context);
              })
        ],
      ),
    );
  }
}