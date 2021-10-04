import 'package:at_onboarding_flutter/screens/onboarding_widget.dart';
import 'package:at_onboarding_flutter/utils/app_constants.dart';
import 'package:attached/app/themes.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:attached/ui/signInView/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        onModelReady: (model) async => await model.initialize(),
        builder: (context, model, child) => Scaffold(
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Builder(
                  builder: (context) => Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AttachedLogo(),
                          Text(
                            'Get Att@ched',
                            style: attachedStyle,
                          ),
                          Flexible(
                            child: RaisedButton(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'I Have an @ Sign',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  /// Need to reinitialize these if the user recently logged out
                                  /* if(atProtocolService.atClientService == null) {
                                    //await atProtocolService.setupPreferences();
                                    await AtProtocolService.getInstance().getAtClientPreference();
                                  }*/

                                  Onboarding(
                                    context: context,
                                    logo: Icon(Icons.ac_unit),
                                    atClientPreference: atProtocolService.atClientPreference!,
                                    appColor: Color.fromARGB(255, 240, 94, 62),
                                    onboard: (atClientServiceMap, atsign) {
                                      //assign this atClientServiceMap in the app.
                                    },
                                    appAPIKey: '400b-806u-bzez-z42z-6a3p',
                                    onError: (error) {
                                      //handle the error
                                      print('Onboarding error: ' + error.toString());
                                    },
                                    nextScreen: HomeView(),
                                    //fistTimeAuthNextScreen: Details(),
                                    // rootEnviroment is a required parameter for setting the environment
                                    // for the onboarding flow.
                                    rootEnvironment: RootEnvironment.Production,
                                    domain: RootEnvironment.Production.domain,

                                    //appAPIKey:
                                    // API Key is mandatory for production environment.
                                    // appAPIKey: YOUR_API_KEY_HERE
                                  );
                                  //Navigator.pushNamed(context, SignInAtView.id);
                                }),
                          ),
                          Flexible(
                            child: OutlineButton(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
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
      ),
    );
  }
}
