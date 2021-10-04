import 'package:attached/app/app_router.gr.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/love_note_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'note_collection_view_model.dart';

class NoteCollectionView extends StatelessWidget {

  final String type;

  const NoteCollectionView({Key? key, required this.type}) : super(key: key); // Image, Link, Location

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<NoteCollectionViewModel>.reactive(
      viewModelBuilder: () => NoteCollectionViewModel(type),
      onModelReady: (model) {
        model.initialize(type);
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: themeService.darkColor(context),
              title:Text(model.type + ' Collection'),
            ),
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.notes.length,
                      itemBuilder:(context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                          height: 200,
                          width: 300,
                          child: LoveNoteCard(model.notes[index]));
                    },),
                  )
                ],
              )
          ),
        );
      },
    );
  }
}