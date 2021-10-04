import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../new_note_view_model.dart';
import 'note_attachment_fab.dart';

class NewNoteFabs extends ViewModelWidget<NewNoteViewModel> {
  @override
  Widget build(BuildContext context, NewNoteViewModel model) {
    PersistentBottomSheetController bottom;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: model.showAttachmentFab
          ? FloatingActionButton(
              heroTag: 'add attachment',
              backgroundColor: model.loveNote?.attachmentType != null? Colors.blueGrey.shade700 :Theme.of(context).primaryColorDark,
              child: Icon(model.attachmentIcons[model.loveNote?.attachmentType]),
              onPressed: () {
                bottom = showBottomSheet(
                  backgroundColor: Colors.black38,
                  context: context,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      expand: true,
                      initialChildSize: .5,
                      minChildSize: .25,
                      maxChildSize: .5,
                      builder: (context, scrollController) => Container(
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black45, offset: Offset(0, 2), blurRadius: 2)],
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            )),
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            // Disabling the highlight glow in listview
                            overscroll.disallowGlow();
                            return true;
                          },
                          child: ListView(
                            controller: scrollController,
                            shrinkWrap: true,
                            children: [
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Select an Attachment',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800
                                ),),
                              )),
                              NoteAttachmentFab('Image', 'Add an image', () {
                                // Take image
                                model.addImage();
                              }, Icons.image),
                              NoteAttachmentFab('Location', 'Add a location', () {
                                model.addLocation(context);
                              }, Icons.location_on_rounded),
                              NoteAttachmentFab('Link', 'Add a link', () {
                                model.addLink(context);
                              }, Icons.link),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );

                model.setFabVisibility(false);

                bottom.closed.then((value) {
                  model.setFabVisibility(true);
                });
              })
          : Container(),
    );
  }
}
