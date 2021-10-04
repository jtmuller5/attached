import 'package:attached/app/app_router.dart';
import 'package:attached/app/app_router.gr.dart';
import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/love_note_card.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:at_commons/at_commons.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {
          model.initializeHome();
        },
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            drawer: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('text'),
                    onTap: () async {
                      try {
                        // Get an instance of AtClient for the current user
                        var atClient = atProtocolService.atClient;
                        // Scans keys shared by the person you're att@ched to
                        List<String> sharedKeys = await atClient?.getKeys(sharedBy: attachedService.theirAtSign) ?? [];

                        sharedKeys.forEach((element) async {
                          var key = AtKey.fromString(element);
                          print(key);
                          if (key.key?.contains('note') ?? false) {
                            try {
                              var value = await atClient?.get(key);

                              if (value != null) {
                                print('Value: ' + value.value.toString());
                                var newNote = LoveNote(
                                  message: value.value.toString(),
                                  mainColor: Colors.blue,
                                  sender: true ? attachedService.myAtSign ?? '' : attachedService.theirAtSign ?? '',
                                  date: '11/18/20',
                                  attachmentContent: null,
                                  attachmentType: '',
                                  key: '',
                                );
                                noteService.addNote(newNote);
                              }
                            } catch (e) {
                              print('Error Getting Value: ' + e.toString());
                            }
                          }
                        });
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  ),
                  ListTile(
                    title: Text('Reconnect'),
                    onTap: () {
                      atProtocolService.status();
                    },
                  ),
                  ListTile(
                    title: Text('Log Out'),
                    onTap: () {
                      atProtocolService.logout(context);
                    },
                  )
                ],
              ),
            ),
            body: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  title: OutlinedButton(
                    onPressed: () {
                      appRouter.push(AttachViewRoute());
                    },
                    style: OutlinedButton.styleFrom(primary: Colors.white),
                    child: attachedService.theirAtSign != null ? Text(attachedService.theirAtSign ?? '') : Text('Attach'),
                  ),
                  centerTitle: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return LoveNoteCard( model.notes[index]);
                    },
                    childCount: model.notes.length,
                  ),
                ),
              ],
            ),
            floatingActionButton: Builder(builder: (context) {
              return FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  shape: CircleBorder(side: BorderSide(width: 2, color: Colors.black)),
                  onPressed: () async {
                    // Go create a new note
                    dynamic newNote = await appRouter.push(
                      NewNoteViewRoute(),
                    );

                    if (newNote != null) {
                      if (model.pageController.hasClients) {
                        await model.pageController.animateToPage(
                          noteService.notes.length,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    }
                  },
                  child: ShadowIcon(
                    icon: Icons.outgoing_mail,
                    shadowColor: Colors.black,
                  ));
            }),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          ));
        });
  }
}
