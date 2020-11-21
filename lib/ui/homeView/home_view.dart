import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/newNoteView/new_note_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  static const String id = "home_view";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) {
        model.initializeHome();
      },
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Background(model.note),
              if (model.notes.length > 0)
                PageView.builder(
                  itemCount: model.notes.length,
                  itemBuilder: (context, index) {
                    return LoveNoteDisplay(model.notes[index], model);
                  },
                ),
              if (model.notes.length == 0) NoNotes(),
              ToFromToggle(model),
              InfoIcon(context),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, NewNoteView.id);
            },
            child: Icon(
              Icons.outgoing_mail,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          /*bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.person), onPressed: null),
                IconButton(icon: Icon(Icons.favorite_border), onPressed: null)
              ],
            ),
          ),*/
        ),
      ),
    );
  }

  Widget InfoIcon(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: IconButton(
        icon: Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        'The @ Protocol ensures that only you and the att@ched person can see these notes. \n\nNot big brother. \n\nNot the FBI. \n\nJust the 2 of you'),
                  ],
                ),
                title: Text('True Privacy'),
                actions: [
                  TextButton(
                    child: Text('Sweet'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget ToFromToggle(HomeViewModel model) {
    return Positioned(
      bottom: 16,
      left: 16,
      child: Container(
        child: Column(
          children: [
            Text(
              'From: ${model.sender}',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              model.senderAt,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 100,
              child: IconButton(
                icon: Icon(
                  Icons.swap_vert_circle,
                ),
                onPressed: () {
                  model.toggleSender();
                },
              ),
            ),
            Text(
              model.receiverAt,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              'To: ${model.receiver}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget Background(LoveNote note) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [note.mainColor, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [-.9, .8])),
    );
  }

  Widget LoveNoteDisplay(LoveNote note, HomeViewModel model) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(note.date,
                    style: GoogleFonts.caveat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    )),
                Text('Swipe left and right for more',
                style: TextStyle(
                  fontWeight: FontWeight.w300
                ),),
              ],
            ),
          ),
          Flexible(flex: 5, child: LoveNoteCard(note, model)),
        ],
      ),
    );
  }

  Widget NoNotes() {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 2,
          ),
          Flexible(
            flex: 2,
            child: Card(
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                child: Text("There's nothing here :("),
              ),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget LoveNoteCard(LoveNote note, HomeViewModel model) {
    return FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Builder(
          builder: (context) => Container(
            width: MediaQuery.of(context).size.width / 3 * 2,
            child: Card(
              shape: BeveledRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Card(
                shape: BeveledRectangleBorder(
                    side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Text(note.message,
                            style: GoogleFonts.caveat(
                                textStyle: TextStyle(fontSize: 16))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        back: Builder(
          builder: (context) => Container(
            width: MediaQuery.of(context).size.width / 3 * 2,
            child: Card(
              shape: BeveledRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Card(
                shape: BeveledRectangleBorder(
                    side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            model.senderAt,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            note.date,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class LoveNote {
  final String message;
  final Color mainColor;
  final String sender;
  final String date;

  LoveNote(this.message, this.mainColor, this.sender, this.date);
}
