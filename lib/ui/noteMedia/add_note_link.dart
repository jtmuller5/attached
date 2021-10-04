import 'package:attached/app/app_router.dart';
import 'package:attached/services/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_note_link_model.dart';

class AddNoteLinkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNoteLinkViewModel>.reactive(
      viewModelBuilder: () => AddNoteLinkViewModel(),
      onModelReady: (model) {
        model.initialize();
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          child: TextField(
                            controller: model.linkController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: InputBorder.none,
                              hintText: 'Add a link'
                            ),
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                        child: Text('Add'),
                        color: themeService.lightColor(context),
                        onPressed: (){
                          appRouter.pop(model.linkController.text);
                    })
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}