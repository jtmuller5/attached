import 'package:attached/app/app_router.dart';
import 'package:attached/app/app_router.gr.dart';
import 'package:attached/app/themes.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/attachView/attach_view_model.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AttachView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttachViewModel>.reactive(
      viewModelBuilder: () => AttachViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AttachedLogo(),
                  if (attachedService.theirAtSign != null)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'You\'re currently attached to ${attachedService.theirAtSign}',
                            textAlign: TextAlign.center,
                            style: attachedStyle,
                          ),
                        ),
                      ),
                    ),
                  Flexible(
                    flex: 2,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Attach to someone new?',
                        textAlign: TextAlign.center,
                        style: attachedStyle,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Card(
                        elevation: 4,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: model.attacheeController,
                          onChanged: (value) {
                            model.updateAttachedString(value);
                          },
                          decoration: attachedInput.copyWith(
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: Colors.black,
                            ),
                            hintText: 'Someone special....',
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColorDark,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Attach',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      model.updateAttached(model.attacheeController.text);
                      appRouter.pushAndPopUntil(HomeViewRoute(), predicate: (route) => false);
                      print('attach');
                    },
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            appRouter.pop();
                          },
                          child: Text('Never Mind'),
                        )
                      ],
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
