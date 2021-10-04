import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:base2e15/base2e15.dart';

class LoveNoteCard extends StatelessWidget {
  final LoveNote note;

  LoveNoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Entry.scale(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColorDark, width: 2), borderRadius: BorderRadius.all(Radius.circular(8))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                  image: note.attachmentContent != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: note.attachmentType == 'Image'
                              ? MemoryImage(Base2e15.decode(note.attachmentContent)) as ImageProvider
                              : CachedNetworkImageProvider(note.attachmentContent))
                      : null),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white54,
                        ),
                        child: Text(
                          note.message ?? '',
                          style: GoogleFonts.caveat(
                            textStyle: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PopupMenuButton(
                          icon: Icon(Icons.more_horiz),
                          initialValue: null,
                          onSelected: (value) {
                            switch (value) {
                              case 'Delete':
                                noteService.deleteNote(note);
                                break;

                              case 'Save':
                                break;

                              case 'Hide':
                                break;
                            }
                          },
                          itemBuilder: (context) {
                            return <PopupMenuEntry>[
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.delete),
                                    Text('Delete'),
                                  ],
                                ),
                                value: 'Delete',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.save),
                                    Text('Save'),
                                  ],
                                ),
                                value: 'Save',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.visibility_off_outlined),
                                    Text('Hide'),
                                  ],
                                ),
                                value: 'Hide',
                              )
                            ];
                          },
                        )
                      ],
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
