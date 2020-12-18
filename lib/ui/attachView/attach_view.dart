import 'package:attached/services/services.dart';
import 'package:attached/ui/attachView/attach_view_model.dart';
import 'package:attached/ui/homeView/bodyWidgets/home_body.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AttachView extends StatelessWidget {
  static const String id = 'attach_view';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttachViewModel>.reactive(
      viewModelBuilder: () => AttachViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              AttachedLogo(),
              Flexible(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Who are you \natt@ched to?',
                    textAlign: TextAlign.center,
                    style: themeService.attachedStyle,
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: model.attacheeController,
                    onChanged: (value){
                      model.updateAttachedString(value);
                    },
                    decoration: themeService.appInput.copyWith(
                      prefixIcon: Icon(Icons.alternate_email, color: Colors.white,),
                      hintText: 'Someone special....',
                    ),
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Attach', style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                onPressed: () {
                  model.updateAttached();
                  Navigator.pushNamedAndRemoveUntil(context, HomeView.id, (route) => route.isFirst);
                  print('attach');
                },
              ),
              Spacer(
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
