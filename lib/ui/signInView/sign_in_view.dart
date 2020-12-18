import 'package:attached/services/services.dart';
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:attached/ui/signInView/sign_in_at_view.dart';
import 'package:attached/ui/signInView/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  static const String id = 'sign_in_view';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, model, child) => Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AttachedLogo(),
                  Text(
                    'Get Att@ched',
                    style: themeService.attachedStyle,
                  ),
                  Flexible(
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'I Have an @ Sign',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SignInAtView.id);
                        }),
                  ),
                  Flexible(
                    child: OutlineButton(
                      borderSide:
                          BorderSide(color: themeService.darkColor, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('I Need an @ sign'),
                      onPressed: () {
                        model.launchToAtStore();
                      },
                    ),
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
