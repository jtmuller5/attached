import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/newNoteView/new_note_view_model.dart';
import 'package:attached/ui/newNoteView/new_note_widgets.dart';
import 'package:attached/ui/reusables/attached_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class NewNoteView extends StatelessWidget {
  static const String id = 'new_note_view';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewNoteViewModel>.reactive(
      viewModelBuilder: () => NewNoteViewModel(),
      onModelReady: (model) {
        HomeViewModel homeModel = ModalRoute.of(context).settings.arguments;
        model.initializeNewNote(homeModel);
      },
      builder:(context,model,child)=> Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AttachedLogo(),
                NoteDraft(model: model,),
                Builder(
                  builder:(context) =>  RaisedButton(
                      child: Text('Send', style: TextStyle(color: Colors.white),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      onPressed: (){
                        Navigator.pop(context,model.loveNote);
                        //model.submitNewMessage(context);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
