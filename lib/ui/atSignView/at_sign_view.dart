import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:attached/ui/signInView/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'atSignWidgets/existing_keys.dart';
import 'at_sign_view_model.dart';

class AtSignView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AtSignViewModel>.reactive(
      viewModelBuilder: () => AtSignViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Builder(
            builder: (context) => Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AttachedLogo(),
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
    );
  }
}
