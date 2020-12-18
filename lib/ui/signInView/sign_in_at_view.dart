import 'package:attached/ui/signInView/sign_in_view_model.dart';
import 'package:attached/ui/signInView/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class SignInAtView extends StatelessWidget {
  static const String id = 'sign_in_at_view';

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
                    AlreadySignedIn(context),
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
}
