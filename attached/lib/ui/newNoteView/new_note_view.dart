import 'package:attached/ui/newNoteView/new_note_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class NewNoteView extends StatelessWidget {
  static const String id = "new_note_view";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewNoteViewModel>.reactive(
      viewModelBuilder: () => NewNoteViewModel(),
      builder:(context,model,child)=> Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: model.noteController,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value){
                    model.updateNoteMessage(value);
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline,color: Colors.red,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      filled: true,
                      focusColor: Colors.red,
                      hintText: 'Send the love',
                      hintStyle: TextStyle(color: Colors.red.shade300)),
                ),
              ),
              RaisedButton(
                  child: Text('Send'),
                  onPressed: (){
                model.submitNewMessage(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
