import 'package:attached/ui/attachView/attach_view.dart';
import 'package:attached/ui/signInView/sign_in_at_view.dart';
import 'package:attached/ui/signInView/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  static const String id = "sign_in_view";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder:(context, model, child) =>  Scaffold(
          body: Builder(
            builder:(context) =>  Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: RaisedButton(
                        child: Text('I Have an @ Sign'),
                        onPressed: () {
                         Navigator.pushNamed(context, SignInAtView.id);
                        }),
                  ),
                  Flexible(
                    child: OutlineButton(
                      child: Text('I Need an @ sign'),
                      onPressed: () {
                        model.launchToAtStore();
                    },),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
