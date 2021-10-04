import 'package:attached/app/app_router.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/newNoteView/new_note_view_model.dart';
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'newNoteWidgets/note_draft.dart';

class NewNoteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewNoteViewModel>.reactive(
      viewModelBuilder: () => NewNoteViewModel(),
      onModelReady: (model) {
        model.initializeNewNote();
      },
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              height: 800,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Flexible(child: AttachedLogo()),
                  NoteDraft(),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey.shade700,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () async {
                              if (model.loveNote?.message != null && model.loveNote?.message?.trim() != '') {

                                await model.submitNewMessage(context);
                              } else {
                                toastService.showToast('Make sure your note isn\'t blank!', color: Colors.blueGrey.shade400);
                              }
                              //model.submitNewMessage(context);
                            },
                            child: Text(
                              'Send',
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(
                            child: Text(
                              'Cancel',
                            ),
                            onPressed: () {
                              appRouter.pop();
                              //model.submitNewMessage(context);
                            })
                      ],
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          //floatingActionButton: NewNoteFabs(),
        ),
      ),
    );
  }
}
